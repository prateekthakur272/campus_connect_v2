from django.db import models
from datetime import datetime
from django.contrib.auth.models import AbstractUser
import uuid

class CampusConnectUser(AbstractUser):
    class Meta:
        verbose_name = 'User'
        verbose_name_plural = "Users"

    phone = models.CharField(max_length=10,null=True, blank=True)
    linkedin = models.URLField(null=True, blank=True)
    github = models.URLField(null=True, blank=True)

    def change_email(self, email):
        self.email = email
        self.save()
    
    def change_phone(self, phone):
        self.phone = phone
        self.save()

    def change_github(self, github):
        self.github = github
        self.save()
    
    def change_linkedin(self, linkedin):
        self.linkedin = linkedin
        self.save()

    def __str__(self) -> str:
        return f'{self.first_name} {self.last_name} ({self.username})'

class Department(models.Model):
    name = models.CharField(max_length=200, null=False)
    code = models.CharField(max_length=10,null=False)
    hod = models.ForeignKey(CampusConnectUser, null=True, on_delete=models.SET_DEFAULT,default=None)
    students = models.ManyToManyField(CampusConnectUser, related_name='students')

    def __str__(self) -> str:
        return f'{self.name} ({self.code})'

class Feedback(models.Model):
    class Meta:
        verbose_name = 'Feedback'
        verbose_name_plural = "Feedbacks"
    
    title = models.CharField(max_length=1000, null=False)
    email = models.CharField(max_length=100, null=False)
    description = models.CharField(max_length=10000, null=False)
    date_time = models.DateTimeField(default=datetime.now,null=False)

    def __str__(self):
        return self.title

class Notification(models.Model):
    class Meta:
        verbose_name = 'Notification'
        verbose_name_plural = "Notifications"
    
    title = models.CharField(max_length=1000, null=False)
    description = models.CharField(max_length=10000, null=False)
    date_time = models.DateTimeField(null=False, auto_now_add=True)