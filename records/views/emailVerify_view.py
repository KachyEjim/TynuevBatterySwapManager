from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.utils.encoding import force_bytes, force_str
from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.urls import reverse
from ..utils import email_verification_token, TOKEN_EXPIRATION_TIME
from django.contrib.auth import get_user_model
from django.core.mail import send_mail
from django.contrib.sites.shortcuts import get_current_site
from django.template.loader import render_to_string
from django.templatetags.static import static
from datetime import datetime, timedelta
from django.utils import timezone

User = get_user_model()


def send_verification_email(request, user):
    token = email_verification_token.make_token(user)
    uid = urlsafe_base64_encode(force_bytes(user.pk))
    current_site = get_current_site(request)
    subject = "Verify your email address"

    verification_url = reverse("verify_email", kwargs={"uidb64": uid, "token": token})
    verification_link = f"http://{current_site.domain}{verification_url}"

    logo_url = request.build_absolute_uri(static("img/logo.svg"))

    message = render_to_string(
        "email_verification.html",
        {
            "user": user.to_dict(),
            "domain": current_site.domain,
            "verification_link": verification_link,
            "logo_url": logo_url,
        },
    )

    send_mail(
        subject,
        message,
        "your_email@example.com",
        [user.email],
        fail_silently=False,
        html_message=message,
    )


def verify_email(request, uidb64, token):
    try:
        uid = force_str(urlsafe_base64_decode(uidb64))
        user = User.objects.get(pk=uid)
    except (TypeError, ValueError, OverflowError, User.DoesNotExist):
        user = None

    if user is not None:
        # Extract timestamp from token
        token_timestamp = email_verification_token._num_seconds_old(
            TOKEN_EXPIRATION_TIME
        )
        current_time = timezone.now()
        token_creation_time = timezone.make_aware(datetime(2001, 1, 1)) + timedelta(
            seconds=token_timestamp
        )

        if (
            email_verification_token.check_token(user, token)
            and (current_time - token_creation_time).total_seconds()
            < TOKEN_EXPIRATION_TIME
        ):
            user.is_active = True
            user.save()
            return redirect("login_view")
        else:
            return HttpResponse("The verification link has expired.")
    else:
        return HttpResponse("Email verification failed.")
