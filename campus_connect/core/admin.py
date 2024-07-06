from django.contrib import admin
from django.contrib.admin import ModelAdmin
from .models import Feedback, CampusConnectUser, Department, Notification

@admin.register(CampusConnectUser)
class CampusConnectUserAdmin(ModelAdmin):
    list_display = ('username', 'first_name', 'last_name',  'email')
    search_fields = ('username', 'first_name', 'last_name',  'email')

@admin.register(Feedback)
class FeedbackAdmin(ModelAdmin):
    list_display = ('title', 'email', 'date_time')
    search_fields = ('title', 'email', 'date_time')


@admin.register(Department)
class DepartmentAdmin(admin.ModelAdmin):
    list_display = ('name','hod',)
    list_filter = ('hod',)
    search_fields = ('code', 'name')
    autocomplete_fields = ('hod','students')


@admin.register(Notification)
class NotificationAdmin(admin.ModelAdmin):
    list_display = ('title','description','date_time',)
    search_fields = ('title', 'description')
