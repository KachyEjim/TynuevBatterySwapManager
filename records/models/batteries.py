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
