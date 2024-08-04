from django.contrib.auth.tokens import PasswordResetTokenGenerator
from django.utils import timezone
from datetime import datetime, timedelta


class EmailVerificationTokenGenerator(PasswordResetTokenGenerator):
    def _make_hash_value(self, user, timestamp):
        return str(user.pk) + str(timestamp) + str(user.is_active)

    def _num_seconds(self, dt):
        # Ensure dt is timezone-aware
        if timezone.is_naive(dt):
            dt = timezone.make_aware(dt)
        # Use the current time in UTC as the reference point
        return int((dt - timezone.make_aware(datetime(2001, 1, 1))).total_seconds())

    def _num_seconds_old(self, timestamp):
        # Ensure the base datetime is timezone-aware
        base_time = timezone.make_aware(datetime(2001, 1, 1))
        return self._num_seconds(base_time + timedelta(seconds=timestamp))

    def _current_timestamp(self):
        return self._num_seconds(timezone.now())


# Specify the expiration time (e.g., 2 hours)
TOKEN_EXPIRATION_TIME = 60 * 60 * 2  # 2 hours in seconds

email_verification_token = EmailVerificationTokenGenerator()
