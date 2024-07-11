from django.db import models
from .base import BaseModel


class Bike(BaseModel):
    """
    Model to represent a bike in the system.
    """

    bike_model = models.CharField(max_length=100)
    bike_serial_number = models.CharField(max_length=100, unique=True)

    def __str__(self):
        return self.bike_serial_number
