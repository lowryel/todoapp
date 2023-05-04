from .models import Task
from django.forms import ModelForm
from django import forms

class TaskForm(ModelForm):
    title=forms.CharField(widget=forms.TextInput(attrs={'placeholder':'Add a task'}))
    class Meta:
        model = Task
        fields = ['title', 'completed']
