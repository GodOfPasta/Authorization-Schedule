from django.shortcuts import render
from django.http import HttpResponse


def index(request):
    return render(request, 'main/authorization.html')

def stud_schedule(request):
    return render(request, 'main/stud_schedule.html')

def teacher_schedule(request):
    return render(request, 'main/teacher_schedule.html')

def admin_table(request):
    return render(request, 'main/admin_table.html')