from django.contrib import admin
from .models import Result, Subject, Exam, Attendance, Marks

@admin.register(Subject)
class SubjectAdmin(admin.ModelAdmin):
    list_display = ('name','code','status')
    list_filter = ('status',)
    search_fields = ('name','code')
    autocomplete_fields = ('department',)

@admin.register(Result)
class ResultAdmin(admin.ModelAdmin):
    list_display = ('exam','student')
    list_filter = ('exam',)
    search_fields = ('student__first_name','student__last_name','exam__name',)
    autocomplete_fields = ('student', 'exam', 'marks')

@admin.register(Exam)
class ExamAdmin(admin.ModelAdmin):
    list_display = ('name','exam_date',)
    list_filter = ('exam_date',)
    search_fields = ('name',)
    autocomplete_fields = ('department',)

@admin.register(Attendance)
class AttenAdmin(admin.ModelAdmin):
    list_display = ('student','subject','attendance')
    list_filter = ('subject',)
    search_fields = ('student', 'subject')
    autocomplete_fields = ('student',)

@admin.register(Marks)
class MarksAdmin(admin.ModelAdmin):
    list_display = ('student','exam','subject','marks_obtained','marks_total')
    list_filter = ('subject',)
    search_fields = ('student__first_name','student__last_name','student__username','exam__name', 'subject__name', 'subject__code')
    autocomplete_fields = ('student','exam','subject')

