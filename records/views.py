# records/views.py
from django.shortcuts import render, redirect
from django.contrib.auth import (
    authenticate,
    login,
    get_user_model,
    logout,
)
from django.http import JsonResponse

from datetime import datetime
from .forms import SignupForm, LoginForm
from django.utils.timezone import now
from django.contrib.auth.decorators import login_required
from .models.bikes import Bike
from .models.batteries import Battery
from .forms import RecordForm


def signup(request):
    if request.method == "POST":
        form = SignupForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect("login")
    else:
        form = SignupForm()
    context = {"form": form, "timestamp": now().timestamp()}
    return render(request, "user/register.html", context)


def login_view(request):
    error_message = None
    if request.method == "POST":
        form = LoginForm(data=request.POST)
        print(form.is_valid())
        if form.is_valid():
            email = form.cleaned_data.get("email")
            password = form.cleaned_data.get("password")
            user = authenticate(request, username=email, password=password)
            if user is not None:
                login(request, user)
                request.session["id"] = str(user.id)
                next_url = request.GET.get("next", "dashboard")
                return redirect(next_url)
            else:
                error_message = "Invalid email or password"
    else:
        form = LoginForm()

    context = {
        "form": form,
        "error_message": error_message,
        "timestamp": now().timestamp(),
    }
    return render(request, "user/login.html", context)


def verify(request):
    if request.user.is_authenticated:
        id = request.session["id"]
        UserModel = get_user_model()
        try:
            user = UserModel.objects.get(id=id)
        except UserModel.DoesNotExist:
            redirect("signup")
        try:
            rider = user.rider
        except user.RelatedObjectDoesNotExist:
            redirect("add_rider")


@login_required
def dashboard(request, segment1=None, segment2=None):
    batteries = Battery.objects.all()
    user = request.user
    record_data = user.records.all().order_by("-created_at")

    context = {
        "timestamp": datetime.now().timestamp(),
        "current_year": datetime.now().year,
        "user": user.to_dict(),
        "record_data": [],
        "batteries": [battery.to_dict() for battery in batteries],
    }

    if segment1 == "record_ride" and segment2 is None:
        if request.method == "POST":
            record_ride(request)
            record_data = user.records.all().order_by("-created_at")[:6]
            context["record_data"] = [record.to_dict() for record in record_data]
            context["user"] = user.to_dict()
            return JsonResponse(context)

    if segment1 == "list_all" and segment2 is None:
        if request.method == "GET":
            record_data = user.records.all().order_by("-created_at")
            context["record_data"] = [record.to_dict() for record in record_data]
            context["user"] = user.to_dict()
            return JsonResponse(context)
    record_data = user.records.all().order_by("-created_at")[:6]
    context["record_data"] = [record.to_dict() for record in record_data]
    return render(request, "user/dashboard/dashboard.html", context)


@login_required
def record_ride(request):
    user = request.user
    datetime_str = request.POST.get("datetime")
    kilometer = request.POST.get("kilometer")
    battery_id = request.POST.get("battery")

    try:
        datetime_obj = datetime.fromisoformat(datetime_str)
        battery_instance = Battery.objects.get(id=battery_id)
        record = user.records.create(
            date_time=datetime_obj, kilometer=kilometer, battery=battery_instance
        )
        record.bike = user.bike
        record.save()
        print(record.kilometer)

        return JsonResponse({"success": True, "message": "Record added successfully"})
    except Exception as e:
        return JsonResponse({"success": False, "message": str(e)}, status=400)


@login_required
def logout_view(request):
    logout(request)
    return redirect("login")
