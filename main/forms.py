from django.forms import ModelForm, TextInput
from .models import Cell


class EventForm(ModelForm):
    class Meta:
        model = Cell
        fields = ['event']

        widgets = {
            "event": TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'Cобытие'
            }),
        }


class CellForm(ModelForm):
    class Meta:
        model = Cell
        fields = ['student_group', 'subject_code', 'room', 'teacher_pk', 'event']


class UpdateForm(ModelForm):
    class Meta:
        model = Cell
        fields = ['day', 'student_group', 'subject_code', 'room', 'pair', 'teacher_pk', 'event']
