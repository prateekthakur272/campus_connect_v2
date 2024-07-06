from rest_framework.serializers import ModelSerializer
from .models import Book, BookIssue


class BookSerializer(ModelSerializer):
    class Meta:
        model = Book
        fields = ('id', 'title', 'author','description', 'publication', 'available')


class BookIssueSerializer(ModelSerializer):
    class Meta:
        model = BookIssue
        fields = ('id', 'user', 'book', 'issue_date', 'due_date', 'status',)


class BookIssuePostSerializer(ModelSerializer):
    class Meta:
        model = BookIssue
        fields = ('id', 'user', 'book', 'status',)
