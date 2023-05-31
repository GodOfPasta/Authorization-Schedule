from django.forms import ModelForm, TextInput
from .models import Cell


class CellForm(ModelForm):
    class Meta:
        model = Cell
        fields = ['event']

        widgets = {
            "event": TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'Лекарство'
            })
        }