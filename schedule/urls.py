from django.contrib import admin
from django.urls import path, include
from main import urls

urlpatterns = [
    path('', include(urls)),
]
