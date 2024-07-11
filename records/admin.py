from django.contrib import admin
from .models.riders import IDTracker, Rider
from .models.batteries import Battery
from .models.bikes import Bike
from .models.records import Record
from .models.kin_guarantor_info import KinGuarantorInfo
from .models.users import User


@admin.register(User)
class UserAdmin(admin.ModelAdmin):
    list_display = (
        "id",
        "first_name",
        "last_name",
        "email",
        "phone_number",
        "created_at",
    )
    search_fields = ("id", "first_name", "last_name", "email", "phone_number")


@admin.register(IDTracker)
class IDTrackerAdmin(admin.ModelAdmin):
    list_display = ("id", "last_id")


@admin.register(Rider)
class RiderAdmin(admin.ModelAdmin):
    list_display = (
        "rider_id",
        "first_name",
        "last_name",
        "email",
        "phone_number",
        "created_at",
    )
    search_fields = ("rider_id", "first_name", "last_name", "email", "phone_number")


@admin.register(Battery)
class BatteryAdmin(admin.ModelAdmin):
    list_display = ("battery_model", "battery_serial_number", "created_at")
    search_fields = ("battery_model", "battery_serial_number")


@admin.register(Bike)
class BikeAdmin(admin.ModelAdmin):
    list_display = ("bike_model", "bike_serial_number", "created_at")
    search_fields = ("bike_model", "bike_serial_number")


@admin.register(Record)
class RecordAdmin(admin.ModelAdmin):
    list_display = ("id", "date_time", "kilometer", "user", "created_at")
    search_fields = ("user__rider_id", "user__first_name", "user__last_name")


@admin.register(KinGuarantorInfo)
class KinGuarantorInfoAdmin(admin.ModelAdmin):
    list_display = ("next_of_kin_name", "guarantor_full_name", "rider", "created_at")
    search_fields = ("next_of_kin_name", "guarantor_full_name", "rider__rider_id")
