from django.db import models
from .users import User
from .base import BaseModel


class KinGuarantorInfo(BaseModel):
    """
    Model to store information about a rider's next of kin and guarantor.
    """

    next_of_kin_name = models.CharField(max_length=100, null=True, blank=True)
    next_of_kin_contact_number = models.CharField(max_length=15, null=True, blank=True)
    next_of_kin_email = models.EmailField(max_length=100, null=True, blank=True)
    next_of_kin_home_address = models.TextField(null=True, blank=True)
    next_of_kin_relationship = models.CharField(max_length=50, null=True, blank=True)
    next_of_kin_passport = models.ImageField(
        upload_to="kin/next_of_kin_passports/", null=True, blank=True
    )

    guarantor_full_name = models.CharField(max_length=100, null=True, blank=True)
    guarantor_relationship = models.CharField(max_length=50, null=True, blank=True)
    guarantor_contact_number = models.CharField(max_length=15, null=True, blank=True)
    guarantor_email = models.EmailField(max_length=100, null=True, blank=True)
    guarantor_home_address = models.TextField(null=True, blank=True)
    guarantor_profession = models.CharField(max_length=100, null=True, blank=True)
    guarantor_id = models.ImageField(
        upload_to="kin/guarantor_ids/", null=True, blank=True
    )
    user = models.ForeignKey(
        User, on_delete=models.CASCADE, related_name="kin_guarantor_info"
    )

    def __str__(self):
        return self.next_of_kin_name or "Unnamed Kin Guarantor"
