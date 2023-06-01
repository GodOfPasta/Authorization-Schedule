from django.db import connection
from django.shortcuts import render, redirect
from django.http import HttpResponse
from django import template
from .forms import EventForm, CellForm, UpdateForm
from .models import Cell
from django.views.generic import UpdateView


def index(request):
    # return render(request, 'main/authorization.html')
    return redirect("http://127.0.0.1:8000/login/")


def stud_schedule(request):
    cells = Cell.objects.all()
    context = {'cells': cells}
    return render(request, 'main/stud_schedule.html', context)


def teacher_schedule(request):
    cells = Cell.objects.all()
    context = {'cells': cells}
    return render(request, 'main/teacher_schedule.html', context)


def event_update(request, pk):
    error = ''
    if request.method == 'POST':
        event = request.POST.get('event')
        with connection.cursor() as cursor:
            cursor.execute('call change_event(%s,%s)', [pk, event])
            cursor.close()

        return redirect('cell1-table')

    form = EventForm()

    data = {
        'form': form,
        'error': error
    }

    return render(request, 'main/event.html', data)


def data_update(request, pk):
    error = ''
    if request.method == 'POST':
        student_group = request.POST.get('student_group')
        subject_code = request.POST.get('subject_code')
        room = request.POST.get('room')
        teacher_pk = request.POST.get('teacher_pk')
        event = request.POST.get('event')
        with connection.cursor() as cursor:
            cursor.execute('call data_update(%s,%s,%s,%s,%s,%s)',
                           [student_group, subject_code, room, teacher_pk, event, pk])
            cursor.close()
        return redirect('cell2-table')

    form = UpdateForm()

    data = {
        'form': form,
        'error': error
    }

    return render(request, 'main/dataChange.html', data)


def admin_table(request):
    cells = Cell.objects.all()
    context = {'cells': cells}
    return render(request, 'main/admin_table.html', context)


def data_create(request):
    day = request.GET.get('day')
    pair = request.GET.get('pair')
    student_group = request.GET.get('student_group')
    error = ''
    if request.method == 'POST':
        subject_code = request.POST.get('subject_code')
        room = request.POST.get('room')
        teacher_pk = request.POST.get('teacher_pk')
        event = request.POST.get('event')
        with connection.cursor() as cursor:
            cursor.execute('call add_cell(%s,%s,%s,%s,%s,%s,%s)',
                           [day, student_group, subject_code, room, pair, teacher_pk, event])
            cursor.close()
            return redirect('cell2-table')
    form = CellForm()

    data = {
        'form': form,
        'error': error
    }
    return render(request, 'main/dataNew.html', data)

