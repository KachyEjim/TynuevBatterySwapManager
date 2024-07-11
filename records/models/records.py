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
    kilometer = models.DecimalField(max_digits=10, decimal_places=2)
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name="records")

    bike = models.ForeignKey(Bike, on_delete=models.CASCADE, null=True, blank=True)
    battery = models.ForeignKey(
        Battery, on_delete=models.CASCADE, null=True, blank=True
    )

    def __str__(self):
        """
        Returns a string representation of the Record instance.
        """
        return f"Record {self.id} by {self.user.rider_id}"
