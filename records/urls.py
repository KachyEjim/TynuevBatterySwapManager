from django.urls import path
from .views import signup, login_view, dashboard, logout_view

urlpatterns = [
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
    path("verify-email/", views.verify - email, name="verify_email"),
    path("verify-email/<uidb64>/<token>/", views.verify_email, name="verify_email"),
]
