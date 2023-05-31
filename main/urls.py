from django.urls import path
from . import views

urlpatterns = [
    path('', views.index),
    path('stud_schedule', views.stud_schedule),
    path('teacher_schedule', views.teacher_schedule, name='cell-table'),
    path('admin_table', views.admin_table),
    path('teacher_schedule/<int:pk>', views.EventUpdateView.as_view(), name='event-update'),
    path('admin_table', views.main_admin),
]
