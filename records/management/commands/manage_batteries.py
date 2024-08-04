from django.core.management.base import BaseCommand
from records.models.batteries import Battery  # Replace with your actual app and model
from django.core.exceptions import ValidationError


class Command(BaseCommand):
    help = "Manage multiple batteries: add, update, delete, or list."

    def add_arguments(self, parser):
        parser.add_argument(
            "action",
            choices=["add", "update", "delete", "list"],
            help="Action to perform on the batteries",
        )
        parser.add_argument(
            "--batteries",
            type=str,
            help='Comma-separated list of batteries in JSON format. Example: [{"model": "Duracell AA", "serial": "1234567890"}]',
        )

    def handle(self, *args, **kwargs):
        action = kwargs["action"]
        batteries = kwargs["batteries"]
        if batteries:
            try:
                import json

                batteries = json.loads(batteries)
            except json.JSONDecodeError:
                self.stdout.write(
                    self.style.ERROR("Invalid JSON format for batteries.")
                )
                return
        else:
            batteries = []

        if action == "add":
            self.add_batteries(batteries)
        elif action == "update":
            self.update_batteries(batteries)
        elif action == "delete":
            self.delete_batteries(batteries)
        elif action == "list":
            self.list_batteries()

    def add_batteries(self, batteries):
        for battery in batteries:
            try:
                Battery.objects.get_or_create(
                    battery_model=battery["model"],
                    battery_serial_number=battery["serial"],
                )
                self.stdout.write(
                    self.style.SUCCESS(f"Added battery: {battery['serial']}")
                )
            except ValidationError as e:
                self.stdout.write(
                    self.style.ERROR(
                        f"Validation error for battery {battery['serial']}: {e}"
                    )
                )
            except Exception as e:
                self.stdout.write(
                    self.style.ERROR(f"Error adding battery {battery['serial']}: {e}")
                )

    def update_batteries(self, batteries):
        for battery in batteries:
            try:
                obj = Battery.objects.get(battery_serial_number=battery["serial"])
                obj.battery_model = battery["model"]
                obj.save()
                self.stdout.write(
                    self.style.SUCCESS(f"Updated battery: {battery['serial']}")
                )
            except Battery.DoesNotExist:
                self.stdout.write(
                    self.style.ERROR(
                        f"Battery with serial {battery['serial']} does not exist."
                    )
                )
            except Exception as e:
                self.stdout.write(
                    self.style.ERROR(f"Error updating battery {battery['serial']}: {e}")
                )

    def delete_batteries(self, batteries):
        for battery in batteries:
            try:
                obj = Battery.objects.get(battery_serial_number=battery["serial"])
                obj.delete()
                self.stdout.write(
                    self.style.SUCCESS(f"Deleted battery: {battery['serial']}")
                )
            except Battery.DoesNotExist:
                self.stdout.write(
                    self.style.ERROR(
                        f"Battery with serial {battery['serial']} does not exist."
                    )
                )
            except Exception as e:
                self.stdout.write(
                    self.style.ERROR(f"Error deleting battery {battery['serial']}: {e}")
                )

    def list_batteries(self):
        batteries = Battery.objects.all()
        if not batteries:
            self.stdout.write(self.style.WARNING("No batteries found."))
        for battery in batteries:
            self.stdout.write(
                self.style.SUCCESS(
                    f"Serial: {battery.battery_serial_number}, Model: {battery.battery_model}"
                )
            )
