from django.core.management.base import BaseCommand
from django.contrib.auth import get_user_model


class Command(BaseCommand):
    help = "Retrieve and print user information"

    def add_arguments(self, parser):
        # Add arguments to specify the user (e.g., by username or email)
        parser.add_argument(
            "identifier", type=str, help="Username or email of the user"
        )

    def handle(self, *args, **kwargs):
        identifier = kwargs["identifier"]
        User = get_user_model()

        try:
            # Attempt to get the user by username or email
            user = User.objects.get(username=identifier)
        except Exception:
            try:
                user = User.objects.get(email=identifier)
            except User.DoesNotExist:
                self.stdout.write(
                    self.style.ERROR(
                        f"User with identifier '{identifier}' does not exist."
                    )
                )
                return

        # Print the user's information
        self.stdout.write(self.style.SUCCESS(f"User ID: {user.id}"))
        self.stdout.write(self.style.SUCCESS(f"Username: {user.last_login}"))
        self.stdout.write(self.style.SUCCESS(f"Email: {user.email}"))
        self.stdout.write(self.style.SUCCESS(f"First Name: {user.first_name}"))
        self.stdout.write(self.style.SUCCESS(f"Last Name: {user.last_name}"))
        self.stdout.write(self.style.SUCCESS(f"Is Active: {user.password}"))
        # Add more fields as needed
