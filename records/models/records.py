from django.db import models
from .base import BaseModel
from .bikes import Bike
from .batteries import Battery
from .users import User


class Record(BaseModel):
    """
    Model to store ride records for riders.
    """

    date_time = models.DateTimeField()
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name="records")
    kilometer = models.DecimalField(max_digits=50, decimal_places=3)
    bike = models.ForeignKey(Bike, on_delete=models.CASCADE, null=True, blank=True)
    battery = models.ForeignKey(
        Battery, on_delete=models.CASCADE, null=True, blank=True
    )

    def __str__(self):
        """
        Returns a string representation of the Record instance.
        """
        return f"Record {self.id} by {self.user.id}"

    def to_dict(self, exclude_fields=None, date_format="iso", include_class_name=True):
        """
        Returns a dictionary representation of the model instance.

        """
        base_dict = super().to_dict()
        new_dict = {
            "date": self.date_time.strftime("%B %d, %Y"),
            "time": self.date_time.strftime("%I:%M %p")
            .lower()
            .replace("am", "a.m.")
            .replace("pm", "p.m."),
            "date_time": self.date_time.isoformat(),
            "bike_model": self.bike.bike_model if self.bike else "N/A",
            "bike_serial_numbe": (self.bike.bike_serial_number if self.bike else "N/A"),
            "bike_id": self.bike.id if self.bike else "N/A",
            "battery_id": self.battery.id if self.battery else "N/A",
            "battery_model": self.battery.battery_model if self.battery else "N/A",
            "battery_serial_number": (
                self.battery.battery_serial_number if self.battery else "N/A"
            ),
        }
        base_dict.update(new_dict)
        return base_dict
