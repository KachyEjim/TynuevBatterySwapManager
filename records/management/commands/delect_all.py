from django.core.management.base import BaseCommand
from django.apps import apps


class Command(BaseCommand):
    help = "Deletes all data in the database."

    def handle(self, *args, **options):

        try:
            models = apps.get_models()
            for model in models:
                print(model.objects.all())
                model_name = model.__name__
                self.stdout.write(self.style.SUCCESS(model_name))
                confirmation = input(
                    "Are you sure you want to delete all data? This action cannot be undone. (yes/no): "
                )
                if confirmation.lower() != "yes":
                    self.stdout.write(self.style.WARNING("Operation cancelled."))
                    return
                model.objects.all().delete()
            self.stdout.write(self.style.SUCCESS("Successfully deleted all data."))
        except Exception as e:
            self.stdout.write(self.style.ERROR(f"An error occurred: {e}"))
