from django.test import TestCase
from taskapp.models import Task
import datetime
import time
# from django.utils import timezone

now = datetime.datetime.now()
class PostTestCase(TestCase):
    def testTask(self):
        post = Task(title="My Title", completed=True, created=now)
        self.assertEqual(post.title, "My Title")
        self.assertEqual(post.completed, True)
        self.assertIs(post.created, now)
# # Create your tests here.

