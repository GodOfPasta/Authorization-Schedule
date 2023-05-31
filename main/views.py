from django.shortcuts import render, redirect
from django.http import HttpResponse
from .models import Cell
from django.views.generic import UpdateView


def index(request):
    # return render(request, 'main/authorization.html')
    return redirect("http://127.0.0.1:8000/login/")


def stud_schedule(request):
    return render(request, 'main/stud_schedule.html')


def teacher_schedule(request):
    cells = Cell.objects.all()
    context = {'cells': cells}
    return render(request, 'main/teacher_schedule.html', context)


class EventUpdateView(UpdateView):
    model = Cell
    template_name = 'main/event.html'

    fields = ['event']


def admin_table(request):
    return render(request, 'main/admin_table.html')
