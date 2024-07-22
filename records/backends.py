from django.contrib.auth.backends import ModelBackend
from django.contrib.auth import get_user_model


class EmailAuthBackend(ModelBackend):
    def authenticate(self, request, username=None, password=None, **kwargs):
        UserModel = get_user_model()
        try:
            user = UserModel.objects.get(email=username)  # Email used as username
        except UserModel.DoesNotExist:
            return None
        if user.check_password(password) and self.user_can_authenticate(user):
            return user
        return None
