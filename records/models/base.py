import uuid
import json
from datetime import datetime
from django.db import models
from django.contrib.auth.models import BaseUserManager
from django.utils import timezone


class UserManager(BaseUserManager):
    def create_user(self, email, password=None, **extra_fields):
        """
        Creates and returns a regular user with an email and password.

        :param email: User's email address.
        :param password: User's password.
        :param extra_fields: Additional fields for the user.
        :return: The created user instance.
        """
        if not email:
            raise ValueError("The Email field must be set")
        email = self.normalize_email(email)
        user = self.model(email=email, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password=None, **extra_fields):
        """
        Creates and returns a superuser with an email and password.

        :param email: Superuser's email address.
        :param password: Superuser's password.
        :param extra_fields: Additional fields for the superuser.
        :return: The created superuser instance.
        """
        extra_fields.setdefault("is_staff", True)
        extra_fields.setdefault("is_superuser", True)

        if extra_fields.get("is_staff") is not True:
            raise ValueError("Superuser must have is_staff=True.")
        if extra_fields.get("is_superuser") is not True:
            raise ValueError("Superuser must have is_superuser=True.")

        return self.create_user(email, password, **extra_fields)


class BaseModel(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        abstract = True

    @staticmethod
    def serialize_instance(instance):
        """
        Serialize a Django model instance to a dictionary representation.

        :param instance: The Django model instance to serialize.
        :return: A dictionary with field names as keys and field values as values.
        """
        instance_dict = {}
        for field in instance._meta.get_fields():
            if field.many_to_one or field.one_to_one or field.many_to_many:
                # This checks if the related object has a _meta attribute, which means it's also a model instance
                value = getattr(instance, field.name)
                if isinstance(value, list):
                    value = [
                        (
                            BaseModel.serialize_instance(obj)
                            if hasattr(obj, "_meta")
                            else obj
                        )
                        for obj in value
                    ]
                elif hasattr(value, "_meta"):
                    value = BaseModel.serialize_instance(value)
                else:
                    value = None
            else:
                value = getattr(instance, field.name)

            if isinstance(value, datetime):
                value = value.isoformat()
            elif isinstance(value, (list, dict)):
                # Convert lists and dicts into JSON strings
                value = json.dumps(value, default=str)
            instance_dict[field.name] = value

        return instance_dict

    def to_dict(self, exclude_fields=None, date_format="iso", include_class_name=True):
        """
        Returns a dictionary representation of the model instance.

        :param exclude_fields: List of field names to exclude from the dictionary.
        :param date_format: Format for datetime fields ('strftime' or 'iso').
        :param include_class_name: Whether to include the class name in the dictionary.
        :return: Dictionary with field names as keys and field values as values.
        """
        exclude_fields = exclude_fields or []
        new_dict = {}

        for field in self._meta.get_fields():
            if field.name not in exclude_fields:
                value = getattr(self, field.name)
                if isinstance(value, datetime):
                    if date_format == "strftime":
                        value = value.strftime("%Y-%m-%d %H:%M:%S")
                    elif date_format == "iso":
                        value = value.isoformat()
                elif isinstance(value, (list, dict)):
                    # Convert list elements to dicts or JSON strings
                    value = [
                        (
                            BaseModel.serialize_instance(obj)
                            if hasattr(obj, "_meta")
                            else obj
                        )
                        for obj in value
                    ]
                    value = json.dumps(value, default=str)
                new_dict[field.name] = value

        if include_class_name:
            new_dict["__class__"] = self.__class__.__name__
        if "id" in new_dict:
            new_dict["id"] = str(new_dict["id"])

        if "password" in new_dict:
            del new_dict["password"]
        return new_dict
