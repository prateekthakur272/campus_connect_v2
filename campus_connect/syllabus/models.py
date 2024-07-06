from django.db import models

class Syllabus(models.Model):
    class Meta():
        verbose_name = 'Syllabus'
        verbose_name_plural = 'Syllabus'
    
    title = models.CharField(max_length=200,)
    file = models.FileField(upload_to='uploads/syllabus', help_text='Upload .pdf files only')