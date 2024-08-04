from django.urls import path
from .views.views import signup, login_view, dashboard, logout_view, test
from .views.emailVerify_view import send_verification_email, verify_email

urlpatterns = [
    path("test/", test, name="test"),
    path("signup/", signup, name="signup"),
    path("login/", login_view, name="login"),
    path("logout/", logout_view, name="logout"),
    path("", dashboard, name="dashboard"),  # Add this line
    path("dashboard/<str:segment1>/", dashboard, name="dashboard_with_segment1"),
    path(
        "dashboard/<str:segment1>/<str:segment2>/",
        dashboard,
        name="dashboard_with_subroute",
    ),
    path(
        "send_verification_email/",
        send_verification_email,
        name="send_verification_email",
    ),
    path("verify-email/<uidb64>/<token>/", verify_email, name="verify_email"),
]
