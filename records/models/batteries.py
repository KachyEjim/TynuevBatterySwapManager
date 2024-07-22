from django.db import models
from .base import BaseModel


class Battery(BaseModel):
    """
    Model to represent a battery in the system.
    """

    battery_model = models.CharField(max_length=100)
    battery_serial_number = models.CharField(max_length=100, unique=True)

    def __str__(self):
        return self.battery_serial_number

    def to_dict(self):
        return {
            "id": self.id,
            "battery_model": self.battery_model,
            "battery_serial_number": self.battery_serial_number,
            "created_at": self.created_at.isoformat(),
            "updated_at": self.updated_at.isoformat(),
        }
