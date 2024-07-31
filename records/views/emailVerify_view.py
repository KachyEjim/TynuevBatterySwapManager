from django.contrib.auth import get_user_model
from django.contrib.sites.shortcuts import get_current_site
from django.core.mail import send_mail
from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.template.loader import render_to_string
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.utils.encoding import force_bytes, force_str
from ..forms import email_verification_token

User = get_user_model()


def send_verification_email(request, user):
    token = email_verification_token.make_token(user)
    uid = urlsafe_base64_encode(force_bytes(user.pk))
    current_site = get_current_site(request)
    subject = "Verify your email address"
    message = render_to_string(
        "email_verification.html",
        {
            "user": user,
            "domain": current_site.domain,
            "uid": uid,
            "token": token,
        },
    )
    send_mail(subject, message, "drealkachy@gmail.com", [user.email])


def verify_email(request, uidb64, token):
    try:
        uid = force_str(urlsafe_base64_decode(uidb64))
        user = User.objects.get(pk=uid)
    except (TypeError, ValueError, OverflowError, User.DoesNotExist):
        user = None

    if user is not None and email_verification_token.check_token(user, token):
        user.is_auth = True
        user.save()
        return HttpResponse("Email verified successfully.")
    else:
        return HttpResponse("Email verification failed.")


# views.py


def email_sent(request):
    return render(request, "email_sent.html")
