from django.urls import path
from .views import home, updateTask, deleteTask

urlpatterns = [
    path('', home, name='home'),
    path('update/<str:pk>', updateTask, name='update'),
    path('delete/<str:pk>', deleteTask, name='delete'),
]
