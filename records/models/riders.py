from typing import Any
from django.db import models, transaction
from datetime import datetime
from .base import BaseModel


class IDTracker(BaseModel):
    """
    Model to keep track of the last generated ID for Riders.
    """

    last_id = models.IntegerField(default=0)


class Rider(BaseModel):
    """
    Model to store information about a rider.
    """

    rider_id = models.CharField(max_length=20, unique=True, null=False, blank=False)
    first_name = models.CharField(max_length=100, null=False, blank=False)
    last_name = models.CharField(max_length=100, null=False, blank=False)
    date_of_birth = models.DateField(null=True, blank=True)
    email = models.EmailField(max_length=100, unique=True, null=False, blank=False)
    password = models.CharField(max_length=255, null=False, blank=False)
    address = models.TextField(null=True, blank=True)
    phone_number = models.CharField(max_length=15, null=True, blank=True)
    place_of_birth = models.CharField(max_length=100, null=True, blank=True)
    gender = models.CharField(max_length=10, null=True, blank=True)
    height = models.DecimalField(max_digits=5, decimal_places=2, null=True, blank=True)
    religion = models.CharField(max_length=50, null=True, blank=True)
    complexion = models.CharField(max_length=50, null=True, blank=True)
    hair_color = models.CharField(max_length=50, null=True, blank=True)
    nationality = models.CharField(max_length=50, null=True, blank=True)
    state_of_origin = models.CharField(max_length=50, null=True, blank=True)
    contact_number = models.CharField(max_length=15, null=True, blank=True)
    contact_number_alternate = models.CharField(max_length=15, null=True, blank=True)
    permanent_home_address = models.TextField(null=True, blank=True)
    emergency_contact_name = models.CharField(max_length=100, null=True, blank=True)
    emergency_contact_number = models.CharField(max_length=15, null=True, blank=True)
    emergency_contact_relationship = models.CharField(
        max_length=50, null=True, blank=True
    )
    bank_name = models.CharField(max_length=100, null=True, blank=True)
    account_name = models.CharField(max_length=100, null=True, blank=True)
    account_number = models.CharField(max_length=20, null=True, blank=True)
    bvn = models.CharField(max_length=11, null=True, blank=True)
    picture = models.ImageField(upload_to="s/pictures/", null=True, blank=True)
    headshot = models.ImageField(upload_to="s/headshots/", null=True, blank=True)
    s_card = models.ImageField(upload_to="s/cards/", null=True, blank=True)
    government_id = models.ImageField(
        upload_to="s/government_ids/", null=True, blank=True
    )
    proof_of_residency = models.ImageField(
        upload_to="s/proofs_of_residency/", null=True, blank=True
    )
    marital_status = models.CharField(max_length=20, null=True, blank=True)
    delivery_companies = models.CharField(max_length=255, null=True, blank=True)
    avg_deliveries_per_day = models.IntegerField(null=False, blank=False)
    avg_weekly_earnings = models.DecimalField(
        max_digits=10, decimal_places=2, null=True, blank=True
    )

    def save(self, *args: Any, **kwargs: Any) -> None:
        """
        Overridden save method to ensure rider_id is generated and set before saving.
        """
        if not self.rider_id:
            self.rider_id = self.generate_rider_id()
        super().save(*args, **kwargs)

    def __str__(self) -> str:
        """
        Returns a string representation of the Rider instance.
        """
        return self.rider_id

    def name(self) -> str:
        """
        Returns the full name of the rider, with first and last names capitalized.
        """
        return f"{self.first_name.capitalize()} {self.last_name.capitalize()}"

    def age(self) -> int:
        """
        Calculates and returns the age of the rider based on their date of birth.
        """
        today = datetime.today()
        age = today.year - self.date_of_birth.year
        if today.month < self.date_of_birth.month or (
            today.month == self.date_of_birth.month
            and today.day < self.date_of_birth.day
        ):
            age -= 1
        return age

    @classmethod
    def generate_rider_id(cls) -> str:
        """
        Generates a unique rider_id based on the current date and the last_id from IDTracker.
        Ensures atomicity to prevent race conditions.
        """
        today = datetime.now()
        year = today.strftime("%y")
        month = today.strftime("%m")
        day = today.strftime("%d")

        with transaction.atomic():
            tracker, created = IDTracker.objects.get_or_create(id=1)
            tracker.last_id += 1
            tracker.save()

            sequential_id = f"{tracker.last_id:03d}"
            generated_id = f"TEV{year}{month}{day}{sequential_id}"

            return generated_id
