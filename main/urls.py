from django.urls import path
from . import views

urlpatterns = [
    path('', views.user_login, name='login'),
    path('logout/', views.user_logout, name='logout'),
    path('stud_schedule/', views.stud_schedule, name='stud_schedule'),
    path('teacher_schedule', views.teacher_schedule, name='cell1-table'),
    path('admin_table', views.admin_table, name='cell2-table'),
    path('/teacher_schedule/<int:pk>', views.event_update, name='event-update'),
    path('admin_table/<int:pk>', views.data_update, name='data-update'),
    path('admin_table/create', views.data_create, name='data-new')
]
