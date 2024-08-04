# utils.py
from django.contrib.auth.tokens import PasswordResetTokenGenerator
from datetime import datetime, timedelta
from django.utils import timezone


class EmailVerificationTokenGenerator(PasswordResetTokenGenerator):
    def _make_hash_value(self, user, timestamp):
        return str(user.pk) + str(timestamp) + str(user.is_active)

    def _num_seconds(self, dt):
        return int((dt - datetime(2001, 1, 1)).total_seconds())

    def _num_seconds_old(self, timestamp):
        return self._num_seconds(datetime(2001, 1, 1) + timedelta(seconds=timestamp))

    def _current_timestamp(self):
        return self._num_seconds(timezone.now())


# Specify the expiration time (e.g., 2 hours)
TOKEN_EXPIRATION_TIME = 60 * 60 * 2  # 2 hours in seconds

email_verification_token = EmailVerificationTokenGenerator()
