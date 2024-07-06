from django.db.models.signals import post_save, post_delete
from django.dispatch import receiver
from .models import Syllabus
import os

@receiver(post_delete, sender = Syllabus, weak = False)
def report_uploaded(sender, instance, *args, **kwargs):
    syllabus = instance
    print(syllabus.file.file.name)
    if os.path.exists(syllabus.file.file.name):
        os.remove(syllabus.file.file.name)