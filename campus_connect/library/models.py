import datetime
import uuid

from django.db import models
from django.contrib.auth import get_user_model

User = get_user_model()


class Book(models.Model):
    class Meta:
        verbose_name = 'Book'
        verbose_name_plural = 'Books'

    available_choices = ((True, 'Available'), (False, 'Unavailable'))

    id = models.UUIDField(primary_key=True, auto_created=True, editable=False, default=uuid.uuid4)
    title = models.CharField(max_length=200, null=False)
    author = models.CharField(max_length=200, null=False,)
    description = models.CharField(max_length=2000, null=False)
    publication = models.CharField(max_length=200, null=False)
    available = models.BooleanField(choices=available_choices, null=False, default=True)

    def set_availability(self, available: bool):
        self.available = available
        self.save()

    def __str__(self):
        return f'{self.title} by {self.author}'


class BookIssue(models.Model):
    class Meta:
        verbose_name = 'Issues'
        verbose_name_plural = 'Issues'

    status_choices = (
        (0, "Return Due"),
        (1, "Returned"),
    )

    id = models.UUIDField(primary_key=True, auto_created=True, editable=False, default=uuid.uuid4)
    user = models.ForeignKey(User, blank=False, null=False, on_delete=models.DO_NOTHING)
    book = models.ForeignKey(Book, blank=False, null=False, on_delete=models.DO_NOTHING)
    status = models.IntegerField(choices=status_choices, blank=False, null=False, default=0)
    issue_date = models.DateField(auto_now_add=True, editable=False)
    due_date = models.DateField()

    def set_status(self, status):
        if self.status_choices.__contains__(status):
            self.status = status
            self.save()
            return True
        return False

    def set_as_returned(self):
        self.status = 1
        self.save()

    def set_as_due(self):
        self.status = 0
        self.save()

    def save(self, force_insert=False, force_update=False, using=None, update_fields=None):
        self.due_date = datetime.date.today() + datetime.timedelta(days=15)
        super().save()

    def __str__(self):
        return f'{self.id}'
