from django import forms
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from records.models.users import User
from records.models.records import Record
from django.contrib.auth.tokens import PasswordResetTokenGenerator


class SignupForm(UserCreationForm):
    email = forms.EmailField(
        required=True,
        help_text="Required. Inform a valid email address.",
        widget=forms.EmailInput(
            attrs={"class": "form-control", "placeholder": "Enter your email"}
        ),
    )
    first_name = forms.CharField(
        required=True,
        help_text="Required.",
        widget=forms.TextInput(
            attrs={"class": "form-control", "placeholder": "Enter your first name"}
        ),
    )
    last_name = forms.CharField(
        required=True,
        help_text="Required.",
        widget=forms.TextInput(
            attrs={"class": "form-control", "placeholder": "Enter your last name"}
        ),
    )

    password1 = forms.CharField(
        label="Password",
        widget=forms.PasswordInput(
            attrs={"class": "form-control", "placeholder": "Enter a password"}
        ),
        help_text="Your password must contain at least 8 characters.",
    )
    password2 = forms.CharField(
        label="Password confirmation",
        widget=forms.PasswordInput(
            attrs={"class": "form-control", "placeholder": "Confirm your password"}
        ),
        help_text="Enter the same password as before, for verification.",
    )

    class Meta:
        model = User
        fields = [
            "email",
            "first_name",
            "last_name",
            "password1",
            "password2",
        ]

    def save(self, commit=True):
        user = super().save(commit=False)
        user.is_active = True

        if commit:
            user.save()
        return user


class LoginForm(forms.Form):
    email = forms.EmailField(
        required=True,
        widget=forms.EmailInput(
            attrs={
                "class": "form-control",
                "placeholder": "Enter your email",
                "id": "id_email",
            }
        ),
    )
    password = forms.CharField(
        label="Password",
        widget=forms.PasswordInput(
            attrs={"class": "form-control", "placeholder": "Password"}
        ),
    )

    def is_valid(self):
        return super().is_valid()


class RecordForm(forms.ModelForm):
    class Meta:
        model = Record
        fields = ["date_time", "kilometer", "bike", "battery"]


class EmailVerificationTokenGenerator(PasswordResetTokenGenerator):
    pass


email_verification_token = EmailVerificationTokenGenerator()
