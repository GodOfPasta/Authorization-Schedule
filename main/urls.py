from django.urls import path
from . import views
urlpatterns = [
    path('', views.index),
    path('stud_schedule', views.stud_schedule),
    path('teacher_schedule', views.teacher_schedule),
    path('admin_table', views.admin_table),
]