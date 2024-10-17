from django.urls import path

from health.views import HealthCheck

urlpatterns = [
    path('check', HealthCheck.as_view(), name="health-check")
]
