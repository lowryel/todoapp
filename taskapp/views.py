from django.shortcuts import render, redirect
from django.conf import settings
from django.core.cache.backends.base import DEFAULT_TIMEOUT
from django.views.decorators.cache import cache_page
from .models import Task
from .forms import TaskForm

# Create your views here.
# Cache time to live is 15 minutes.
CACHE_TTL = getattr(settings, 'CACHE_TTL', DEFAULT_TIMEOUT)
@cache_page(CACHE_TTL)
def home(request):
    tasks=Task.objects.all()
    form=TaskForm()
    form.is_bound
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

