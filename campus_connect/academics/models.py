from django.db import models
from django_extensions.db.models import TimeStampedModel, ActivatorModel, TitleDescriptionModel
from core.models import Department
from django.contrib.auth import get_user_model

User = get_user_model()


class Subject(models.Model):
    INACTIVE_STATUS = 0
    ACTIVE_STATUS = 1

    STATUS_CHOICES = (
        (INACTIVE_STATUS, 'Inactive'),
        (ACTIVE_STATUS, 'Active'),
    )
    name = models.CharField(max_length=500, null=False)
    code = models.CharField(max_length=10, null=False, unique=True)
    status = models.IntegerField('status', choices=STATUS_CHOICES, default=ACTIVE_STATUS, null=True)
    department = models.ForeignKey(Department, null=False, on_delete=models.CASCADE)

    def __str__(self) -> str:
        return self.name


class Exam(models.Model):
    name = models.CharField(max_length=200, null=False, default='Exam')
    exam_date = models.DateField(null=False, )
    department = models.ForeignKey(Department, on_delete=models.SET_DEFAULT, default=None, null=True)

    def __str__(self) -> str:
        return self.name


class Marks(models.Model):
    class Meta:
        verbose_name = 'Marks'
        verbose_name_plural = 'Marks'

    student = models.ForeignKey(User, on_delete=models.CASCADE)
    exam = models.ForeignKey(Exam, on_delete=models.CASCADE)
    subject = models.ForeignKey(Subject, on_delete=models.CASCADE, null=True)
    marks_total = models.IntegerField(null=False, default=100)
    marks_obtained = models.IntegerField(null=False, default=0)

    def __str__(self) -> str:
        return f"{self.student.get_username()} {self.exam.name} {self.subject.name}({self.subject.code})"


class Result(models.Model):
    student = models.ForeignKey(User, on_delete=models.CASCADE)
    exam = models.ForeignKey(Exam, on_delete=models.CASCADE)
    declare_date = models.DateField(auto_now_add=True, null=False)
    marks = models.ManyToManyField(Marks)

    def __str__(self) -> str:
        return f"{self.exam.name} result"


class Attendance(models.Model):
    class Meta:
        verbose_name = 'Attendance'
        verbose_name_plural = 'Attendance'

    student = models.ForeignKey(User, on_delete=models.CASCADE, null=False)
    subject = models.ForeignKey(Subject, on_delete=models.CASCADE, null=False)
    attendance = models.FloatField(default=0.0, null=False)

    def __str__(self) -> str:
        return f'{self.student.first_name} {self.student.last_name})'
