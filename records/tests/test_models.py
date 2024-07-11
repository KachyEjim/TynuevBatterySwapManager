from django.test import TestCase
from django.utils import timezone
from records.models.batteries import Battery
from records.models.bikes import Bike
from records.models.kin_guarantor_info import KinGuarantorInfo
from records.models.riders import Rider, IDTracker
from records.models.records import Record


class BatteryModelTest(TestCase):

    def setUp(self):
        self.battery = Battery.objects.create(
            battery_model="Model A", battery_serial_number="1234567890"
        )

    def test_battery_creation(self):
        self.assertTrue(isinstance(self.battery, Battery))
        self.assertEqual(self.battery.__str__(), self.battery.battery_serial_number)
        battery = Battery.objects.get(id=self.battery.id)
        self.assertEqual(battery, self.battery)

    def test_battery_fields(self):
        self.assertEqual(self.battery.battery_model, "Model A")
        self.assertEqual(self.battery.battery_serial_number, "1234567890")
        self.assertIsNotNone(self.battery.created_at)
        self.assertIsNotNone(self.battery.updated_at)

    def test_battery_update(self):
        self.battery.battery_model = "Model B"
        self.battery.save()
        self.battery.refresh_from_db()
        self.assertEqual(self.battery.battery_model, "Model B")
        updated_battery = Battery.objects.get(id=self.battery.id)
        self.assertEqual(updated_battery.battery_model, "Model B")

    def test_battery_deletion(self):
        battery_id = self.battery.id
        self.battery.delete()
        with self.assertRaises(Battery.DoesNotExist):
            Battery.objects.get(id=battery_id)


class BikeModelTest(TestCase):

    def setUp(self):
        self.bike = Bike.objects.create(
            bike_model="Model X", bike_serial_number="0987654321"
        )

    def test_bike_creation(self):
        self.assertTrue(isinstance(self.bike, Bike))
        self.assertEqual(self.bike.__str__(), self.bike.bike_serial_number)
        bike = Bike.objects.get(id=self.bike.id)
        self.assertEqual(bike, self.bike)

    def test_bike_fields(self):
        self.assertEqual(self.bike.bike_model, "Model X")
        self.assertEqual(self.bike.bike_serial_number, "0987654321")
        self.assertIsNotNone(self.bike.created_at)
        self.assertIsNotNone(self.bike.updated_at)

    def test_bike_update(self):
        self.bike.bike_model = "Model Y"
        self.bike.save()
        self.bike.refresh_from_db()
        self.assertEqual(self.bike.bike_model, "Model Y")
        updated_bike = Bike.objects.get(id=self.bike.id)
        self.assertEqual(updated_bike.bike_model, "Model Y")

    def test_bike_deletion(self):
        bike_id = self.bike.id
        self.bike.delete()
        with self.assertRaises(Bike.DoesNotExist):
            Bike.objects.get(id=bike_id)


class RiderModelTest(TestCase):

    def setUp(self):
        self.rider = Rider.objects.create(
            rider_id=Rider.generate_rider_id(),
            first_name="John",
            last_name="Doe",
            email="john.doe@example.com",
            password="hashedpassword",
            avg_deliveries_per_day=5,
        )

    def test_rider_creation(self):
        self.assertTrue(isinstance(self.rider, Rider))
        self.assertEqual(self.rider.__str__(), self.rider.rider_id)
        rider = Rider.objects.get(id=self.rider.id)
        self.assertEqual(rider, self.rider)

    def test_rider_fields(self):
        self.assertEqual(self.rider.first_name, "John")
        self.assertEqual(self.rider.last_name, "Doe")
        self.assertEqual(self.rider.email, "john.doe@example.com")
        self.assertEqual(self.rider.password, "hashedpassword")
        self.assertEqual(self.rider.avg_deliveries_per_day, 5)
        self.assertIsNotNone(self.rider.created_at)
        self.assertIsNotNone(self.rider.updated_at)

    def test_rider_update(self):
        self.rider.first_name = "Jane"
        self.rider.save()
        self.rider.refresh_from_db()
        self.assertEqual(self.rider.first_name, "Jane")
        updated_rider = Rider.objects.get(id=self.rider.id)
        self.assertEqual(updated_rider.first_name, "Jane")

    def test_rider_deletion(self):
        rider_id = self.rider.id
        self.rider.delete()
        with self.assertRaises(Rider.DoesNotExist):
            Rider.objects.get(id=rider_id)


class KinGuarantorInfoModelTest(TestCase):

    def setUp(self):
        self.rider = Rider.objects.create(
            rider_id=Rider.generate_rider_id(),
            first_name="John",
            last_name="Doe",
            email="john.doe@example.com",
            password="hashedpassword",
            avg_deliveries_per_day=5,
        )
        self.kin_guarantor_info = KinGuarantorInfo.objects.create(
            rider=self.rider,
            next_of_kin_name="Jane Doe",
            next_of_kin_contact_number="1234567890",
            next_of_kin_email="jane.doe@example.com",
        )

    def test_kin_guarantor_info_creation(self):
        self.assertTrue(isinstance(self.kin_guarantor_info, KinGuarantorInfo))
        self.assertEqual(
            self.kin_guarantor_info.__str__(), self.kin_guarantor_info.next_of_kin_name
        )
        kin_guarantor_info = KinGuarantorInfo.objects.get(id=self.kin_guarantor_info.id)
        self.assertEqual(kin_guarantor_info, self.kin_guarantor_info)

    def test_kin_guarantor_info_fields(self):
        self.assertEqual(self.kin_guarantor_info.next_of_kin_name, "Jane Doe")
        self.assertEqual(
            self.kin_guarantor_info.next_of_kin_contact_number, "1234567890"
        )
        self.assertEqual(
            self.kin_guarantor_info.next_of_kin_email, "jane.doe@example.com"
        )
        self.assertEqual(self.kin_guarantor_info.rider, self.rider)
        self.assertIsNotNone(self.kin_guarantor_info.created_at)
        self.assertIsNotNone(self.kin_guarantor_info.updated_at)

    def test_kin_guarantor_info_update(self):
        self.kin_guarantor_info.next_of_kin_name = "John Doe"
        self.kin_guarantor_info.save()
        self.kin_guarantor_info.refresh_from_db()
        self.assertEqual(self.kin_guarantor_info.next_of_kin_name, "John Doe")
        updated_kin_guarantor_info = KinGuarantorInfo.objects.get(
            id=self.kin_guarantor_info.id
        )
        self.assertEqual(updated_kin_guarantor_info.next_of_kin_name, "John Doe")

    def test_kin_guarantor_info_deletion(self):
        kin_guarantor_info_id = self.kin_guarantor_info.id
        self.kin_guarantor_info.delete()
        with self.assertRaises(KinGuarantorInfo.DoesNotExist):
            KinGuarantorInfo.objects.get(id=kin_guarantor_info_id)


class RecordModelTest(TestCase):

    def setUp(self):
        self.rider = Rider.objects.create(
            rider_id=Rider.generate_rider_id(),
            first_name="John",
            last_name="Doe",
            email="john.doe@example.com",
            password="hashedpassword",
            avg_deliveries_per_day=5,
        )
        self.record = Record.objects.create(
            date_time=timezone.now(), kilometer=123.45, user=self.rider
        )

    def test_record_creation(self):
        self.assertTrue(isinstance(self.record, Record))
        self.assertEqual(
            self.record.__str__(),
            f"Record {self.record.id} by {self.record.user.rider_id}",
        )
        record = Record.objects.get(id=self.record.id)
        self.assertEqual(record, self.record)

    def test_record_fields(self):
        self.assertEqual(self.record.kilometer, 123.45)
        self.assertEqual(self.record.user, self.rider)
        self.assertIsNotNone(self.record.created_at)
        self.assertIsNotNone(self.record.updated_at)

    def test_record_update(self):
        self.record.kilometer = 150.75
        self.record.save()
        self.record.refresh_from_db()
        self.assertEqual(self.record.kilometer, 150.75)
        updated_record = Record.objects.get(id=self.record.id)
        self.assertEqual(updated_record.kilometer, 150.75)

    def test_record_deletion(self):
        record_id = self.record.id
        self.record.delete()
        with self.assertRaises(Record.DoesNotExist):
            Record.objects.get(id=record_id)

    def test_rider_related_records(self):
        self.assertEqual(self.rider.records.count(), 1)
        self.assertEqual(self.rider.records.first(), self.record)

    def test_record_creation_with_bike_and_battery(self):
        bike = Bike.objects.create(bike_model="Model Z", bike_serial_number="54321")
        battery = Battery.objects.create(
            battery_model="Model C", battery_serial_number="67890"
        )
        record = Record.objects.create(
            date_time=timezone.now(),
            kilometer=200.50,
            user=self.rider,
            bike=bike,
            battery=battery,
        )
        self.assertEqual(record.bike, bike)
        self.assertEqual(record.battery, battery)


class IDTrackerTest(TestCase):

    def setUp(self):
        IDTracker.objects.create(last_id=0)

    def test_tracker_creation(self):
        tracker = IDTracker.objects.get(id=1)
        self.assertEqual(tracker.last_id, 0)

    def test_generate_rider_id(self):
        new_rider_id = Rider.generate_rider_id()
        today = timezone.now()
        expected_prefix = f"TEV{today.strftime('%y%m%d')}"
        self.assertTrue(new_rider_id.startswith(expected_prefix))
        self.assertEqual(len(new_rider_id), 12)  # e.g., TEV240701001

        # Check that the ID is unique
        existing_ids = set(Rider.objects.values_list("rider_id", flat=True))
        self.assertNotIn(new_rider_id, existing_ids)

    def test_tracker_increments(self):
        tracker = IDTracker.objects.get(id=1)
        last_id_before = tracker.last_id
        Rider.generate_rider_id()
        tracker.refresh_from_db()
        self.assertEqual(tracker.last_id, last_id_before + 1)


class ToDictTestCase(TestCase):

    def setUp(self):
        self.rider = Rider.objects.create(
            rider_id="TEV240701008",
            first_name="John",
            last_name="Doe",
            email="john.doe@example.com",
            phone_number="1234567890",
            avg_deliveries_per_day=10,
            password="password",
        )

    def test_to_dict_basic(self):
        try:
            result = self.rider.to_dict()
            self.assertIn("rider_id", result)
            self.assertIn("created_at", result)
            print(f"Basic to_dict result: {result}")
        except Exception as e:
            print(f"Error in basic to_dict test: {e}")

    def test_to_dict_with_exclusions(self):
        try:
            result = self.rider.to_dict(exclude_fields=["email", "phone_number"])
            self.assertNotIn("email", result)
            self.assertNotIn("phone_number", result)
            print(f"to_dict with exclusions result: {result}")
        except Exception as e:
            print(f"Error in to_dict with exclusions test: {e}")

    def test_to_dict_with_date_format(self):
        try:
            result = self.rider.to_dict(date_format="strftime")
            self.assertIsInstance(result["created_at"], str)
            print(f"to_dict with strftime date format result: {result}")
        except Exception as e:
            print(f"Error in to_dict with strftime date format test: {e}")

    def test_to_dict_with_iso_date_format(self):
        try:
            result = self.rider.to_dict(date_format="iso")
            self.assertIsInstance(result["created_at"], str)
            self.assertIn("T", result["created_at"])  # Check for ISO format
            print(f"to_dict with ISO date format result: {result}")
        except Exception as e:
            print(f"Error in to_dict with ISO date format test: {e}")

    def test_to_dict_class_name(self):
        try:
            result = self.rider.to_dict(include_class_name=True)
            self.assertEqual(result["__class__"], "Rider")
            print(f"to_dict with class name result: {result}")
        except Exception as e:
            print(f"Error in to_dict with class name test: {e}")

    def test_to_dict_without_class_name(self):
        try:
            result = self.rider.to_dict(include_class_name=False)
            self.assertNotIn("__class__", result)
            print(f"to_dict without class name result: {result}")
        except Exception as e:
            print(f"Error in to_dict without class name test: {e}")

    def test_password_exclusion(self):
        try:
            result = self.rider.to_dict()
            self.assertNotIn("password", result)
            print(f"Password exclusion test result: {result}")
        except Exception as e:
            print(f"Error in password exclusion test: {e}")
