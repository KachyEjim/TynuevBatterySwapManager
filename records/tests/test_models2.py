from django.test import TestCase
from django.utils import timezone
from records.models.batteries import Battery
from records.models.bikes import Bike
from records.models.kin_guarantor_info import KinGuarantorInfo
from records.models.riders import Rider, IDTracker
from records.models.records import Record
from records.models.users import User

from django.contrib.auth import get_user_model


class ModelsTestCase(TestCase):
    def setUp(self):
        self.user = User.objects.create_user(
            email="testuser@example.com",
            password="password123",
            first_name="Test",
            last_name="User",
        )
        self.bike = Bike.objects.create(
            bike_model="Mountain Bike", bike_serial_number="SN12345"
        )
        self.battery = Battery.objects.create(
            battery_serial_number="HWHWH", battery_model="ooooo"
        )
        self.record = Record.objects.create(
            date_time=timezone.now(),
            kilometer=10.5,
            bike=self.bike,
            battery=self.battery,
        )
        self.kin_guarantor = KinGuarantorInfo.objects.create(
            next_of_kin_name="Jane Doe",
            next_of_kin_contact_number="1234567890",
            next_of_kin_email="janedoe@example.com",
            next_of_kin_home_address="123 Main St",
            next_of_kin_relationship="Sister",
            guarantor_full_name="John Smith",
            guarantor_relationship="Friend",
            guarantor_contact_number="0987654321",
            guarantor_email="johnsmith@example.com",
            guarantor_home_address="456 Elm St",
            guarantor_profession="Engineer",
            user=self.user,
        )

    def test_user_creation(self):
        print("\nTesting user creation...")
        self.assertEqual(self.user.email, "testuser@example.com")
        self.assertTrue(self.user.check_password("password123"))
        self.assertEqual(str(self.user), self.user.email)
        print("User creation test passed.")

    def test_bike_creation(self):
        print("\nTesting bike creation...")
        self.assertEqual(self.bike.bike_model, "Mountain Bike")
        self.assertEqual(str(self.bike), self.bike.bike_serial_number)
        print("Bike creation test passed.")

    def test_battery_creation(self):
        print("\nTesting battery creation...")
        self.assertEqual(self.battery.status, "Good")
        self.assertEqual(self.battery.charge_level, 85.5)
        self.assertEqual(str(self.battery), "Battery status: Good, charge level: 85.5")
        print("Battery creation test passed.")

    def test_records_creation(self):
        print("\nTesting records creation...")
        self.assertEqual(self.record.kilometer, 10.5)
        self.assertEqual(
            str(self.record), f"Record on {self.record.date_time} for 10.5 km"
        )
        print("Records creation test passed.")

    def test_kin_guarantor_creation(self):
        print("\nTesting kin and guarantor information creation...")
        self.assertEqual(self.kin_guarantor.next_of_kin_name, "Jane Doe")
        self.assertEqual(self.kin_guarantor.guarantor_full_name, "John Smith")
        self.assertEqual(str(self.kin_guarantor), "Jane Doe")
        print("Kin and guarantor information test passed.")

    def test_serialize_instance(self):
        print("\nTesting serialization of instances...")
        user_dict = User.serialize_instance(self.user)
        self.assertIn("email", user_dict)
        self.assertNotIn("password", user_dict)
        record_dict = Record.serialize_instance(self.record)
        self.assertIn("kilometer", record_dict)
        kin_guarantor_dict = KinGuarantorInfo.serialize_instance(self.kin_guarantor)
        self.assertIn("next_of_kin_name", kin_guarantor_dict)
        print("Instance serialization test passed.")

    def test_to_dict(self):
        print("\nTesting to_dict method...")
        user_dict = self.user.to_dict()
        self.assertIn("email", user_dict)
        self.assertNotIn("password", user_dict)
        record_dict = self.record.to_dict()
        self.assertIn("kilometer", record_dict)
        kin_guarantor_dict = self.kin_guarantor.to_dict()
        self.assertIn("next_of_kin_name", kin_guarantor_dict)
        print("to_dict method test passed.")

    def test_all_together(self):
        print("\nTesting all models together...")
        self.assertEqual(self.user.email, "testuser@example.com")
        self.assertEqual(self.bike.bike_model, "Mountain Bike")
        self.assertEqual(self.battery.status, "Good")
        self.assertEqual(self.record.kilometer, 10.5)
        self.assertEqual(self.kin_guarantor.next_of_kin_name, "Jane Doe")
        print("All models together test passed.")
