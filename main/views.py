from django.db import connection
from django.shortcuts import render, redirect
from .forms import EventForm, CellForm, UpdateForm, LoginForm
from .models import Cell, Student, Teacher
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required, user_passes_test

def is_admin(user):
    return user.is_authenticated() and user.role == 'admin'

def is_student(user):
    return user.is_authenticated() and user.role == 'student'

def is_teacher(user):
    return user.is_authenticated() and user.role == 'teacher'

@login_required
@user_passes_test(is_student)
def stud_schedule(request):
    cells = Cell.objects.all()
    context = {'cells': cells}
    return render(request, 'main/stud_schedule.html', context)

@login_required
@user_passes_test(is_teacher)
def teacher_schedule(request):
    cells = Cell.objects.all()
    context = {'cells': cells}
    return render(request, 'main/teacher_schedule.html', context)

@login_required
@user_passes_test(is_admin)
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

@login_required
@user_passes_test(is_admin)
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

@login_required
@user_passes_test(is_admin)
def admin_table(request):
    cells = Cell.objects.all()
    context = {'cells': cells}
    return render(request, 'main/admin_table.html', context)

@login_required
@user_passes_test(is_admin)
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

def user_login(request):
    if request.method == 'POST':
        form = LoginForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data['username']
            password = form.cleaned_data['password']
            user = authenticate(request, username=username, password=password)
            if user is not None:
                login(request, user)
                if is_admin(user):
                    return redirect('cell2-table') 
                elif is_student(user):
                    student = Student.objects.get(student=user)
                    request.session['name'] = student.name
                    request.session['student_group'] = student.student_group.id
                    return redirect('stud_schedule')
                elif is_teacher(user):
                    teacher = Teacher.objects.get(teacher=user)
                    request.session['name'] = teacher.name
                    request.session['id'] = teacher.pk
                    return redirect('cell1-table')  
            else:
                return render(request, 'main/login.html', {'form': form, 'error_message': 'Invalid login credentials'})
    else:
        form = LoginForm()
    return render(request, 'main/login.html', {'form': form})


def user_logout(request):
    logout(request)
    return render(request, 'main/login.html')
