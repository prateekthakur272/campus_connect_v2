from rest_framework.serializers import ModelSerializer
from .models import Exam, Subject, Attendance, Result, Marks

class SubjectSerializer(ModelSerializer):
    class Meta:
        model = Subject
        fields = ('name', 'code', 'status','department',)

class ExamSerializer(ModelSerializer):
    class Meta:
        model = Exam
        fields = ('name','exam_date','department',)

class MarksSerializer(ModelSerializer):
    class Meta:
        model = Marks
        fields = ('id','student', 'exam', 'subject', 'marks_total', 'marks_obtained')

class ResultSerializer(ModelSerializer):
    class Meta:
        model = Result
        fields = ('id','student', 'exam', 'declare_date', 'marks')

class AttendanceSerializer(ModelSerializer):
    class Meta:
        model = Attendance
        fields = ('id', 'student', 'attendance', 'subject')





