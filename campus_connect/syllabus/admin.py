from django.contrib import admin
from .models import Syllabus
@admin.register(Syllabus)
class SyllabusAdmin(admin.ModelAdmin):
    list_display = ('title',)
    search_fields = ('title',)
