from django.shortcuts import render, redirect
from .models import Task
from .forms import TaskForm

# Create your views here.
def home(request):
    tasks=Task.objects.all()
    form=TaskForm()
    if request.method=="POST":
        form = TaskForm(request.POST)
        if form.is_valid():
            form.save()
        return redirect('/')
    context={
        'tasks':tasks,
        'form':form
    }

    return render(request, 'home.html', context)

def updateTask(request, pk):
    model=Task.objects.get(id=pk)
    form=TaskForm(instance=model)
    if request.method=="POST":
        form=TaskForm(request.POST, instance=model)
        if form.is_valid():
            form.save()
        return redirect('/')
    context={
        'form':form,
    }
    return render(request, 'update.html', context)



def deleteTask(request, pk):
    tasks=Task.objects.get(id=pk)
    if request.method=="POST":
        tasks.delete()
        return redirect('/')
    context={
        'tasks':tasks,
    }
    return render(request, 'delete.html', context)

