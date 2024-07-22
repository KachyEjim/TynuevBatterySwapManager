from django.core.management.base import BaseCommand
from records.models.batteries import (
    Battery,
)  # Adjust the import according to your app's name


class Command(BaseCommand):
    help = "Create five batteries with sample data"

    def handle(self, *args, **options):
        batteries = [
            {"battery_model": "Model A", "battery_serial_number": "SN1234567890"},
            {"battery_model": "Model B", "battery_serial_number": "SN1234567891"},
            {"battery_model": "Model C", "battery_serial_number": "SN1234567892"},
            {"battery_model": "Model D", "battery_serial_number": "SN1234567893"},
            {"battery_model": "Model E", "battery_serial_number": "SN1234567894"},
        ]

        for battery_data in batteries:
            battery, created = Battery.objects.get_or_create(**battery_data)
            if created:
                self.stdout.write(self.style.SUCCESS(f"Battery created: {battery}"))
            else:
                self.stdout.write(
                    self.style.WARNING(f"Battery already exists: {battery}")
                )
