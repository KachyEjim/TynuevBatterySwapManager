import csv
from django.core.management.base import BaseCommand
from records.models.records import Record
from records.models.batteries import Battery
from records.models.users import User

from datetime import datetime

# Default values for missing fields
DEFAULT_TIME = "00:00:00 AM"
DEFAULT_BID = "SN1149"

# Fetch the user object by email
user = User.objects.get(email="ejimovc+1@gmail.com")


class Command(BaseCommand):
    help = "Load records from a CSV file into the database"

    def add_arguments(self, parser):
        parser.add_argument("csv_file", type=str, help="The path to the CSV file.")

    def handle(self, *args, **kwargs):
        csv_file = kwargs["csv_file"]
        with open(csv_file, "r") as file:
            reader = csv.DictReader(file)
            for row in reader:
                try:
                    # Access time from the row directly
                    time = row["time"]

                    # Merge date and time fields and parse them into a datetime object
                    date_time_str = f"{row['date']} {time}"
                    date_time = datetime.strptime(date_time_str, "%d/%m/%Y %I:%M:%S %p")

                    # Retrieve the related models
                    battery = Battery.objects.get(
                        battery_serial_number=row["battery_id"]
                    )

                    kilometer = row.get("kilometer")
                    ODO = row.get("ODO")

                    # Create the Record instance
                    Record.objects.create(
                        date_time=date_time,
                        user=user,
                        kilometer=kilometer,
                        ODO=ODO,
                        battery=battery,
                    )

                    self.stdout.write(
                        self.style.SUCCESS(
                            f"Successfully added record for user {user.id}"
                        )
                    )

                except Exception as e:
                    self.stderr.write(
                        self.style.ERROR(f"Error processing row: {row}. Error: {e}")
                    )
