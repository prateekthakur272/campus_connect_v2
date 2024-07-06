from django.core.exceptions import ValidationError
from rest_framework.views import APIView
from .models import Book, BookIssue
from .serializers import BookSerializer, BookIssueSerializer, BookIssuePostSerializer
from django.http import JsonResponse
from rest_framework.parsers import JSONParser
from rest_framework import status
from django.shortcuts import get_object_or_404
from rest_framework.authentication import get_user_model

User = get_user_model()

class BooksView(APIView):

    @staticmethod
    def get(request):
        books = Book.objects.all()
        available = request.GET.get('available', '')
        if available.lower() == 'true':
            books = Book.objects.filter(available=True)
        elif available.lower() == 'false':
            books = Book.objects.filter(available=False)

        books = books.filter(title__iregex=request.GET.get('search', ''))
        books_serializer = BookSerializer(books, many=True)
        return JsonResponse(books_serializer.data, safe=False)

    @staticmethod
    def post(request):
        data = JSONParser().parse(request)
        book = BookSerializer(data=data)
        if book.is_valid():
            book.save()
            return JsonResponse({'details': f'book added {book.data.get("id")}'})
        return JsonResponse(book.errors, status=status.HTTP_400_BAD_REQUEST)


class BookDetailView(APIView):
    @staticmethod
    def get(request, pk):
        try:
            book = get_object_or_404(Book, id=pk)
        except ValidationError:
            return JsonResponse({'error': 'invalid uuid'}, status=status.HTTP_400_BAD_REQUEST)
        book_serializer = BookSerializer(book)
        return JsonResponse(book_serializer.data)

    @staticmethod
    def delete(request, pk):
        try:
            book = get_object_or_404(Book, id=pk)
        except ValidationError:
            return JsonResponse({'error': 'invalid uuid'}, status=status.HTTP_400_BAD_REQUEST)
        book.delete()
        return JsonResponse({'details': f'deleted book {pk}'})


class BookIssuesView(APIView):
    @staticmethod
    def get(request):
        issues = BookIssue.objects.all()
        issue_status = request.GET.get('status', '')
        if issue_status.lower() == 'due':
            issues = BookIssue.objects.filter(status=0)
        elif issue_status.lower() == 'returned':
            issues = BookIssue.objects.filter(status=1)
        issues_serializer = BookIssueSerializer(issues, many=True)
        return JsonResponse(issues_serializer.data, safe=False)

    @staticmethod
    def post(request):
        data = JSONParser().parse(request)
        book_issue = BookIssuePostSerializer(data=data)
        if book_issue.is_valid():
            book_issue.save()
            return JsonResponse({'details': f'book issued {book_issue.data.get("id")}'})
        return JsonResponse(book_issue.errors, status=status.HTTP_400_BAD_REQUEST)


class BookIssueDetailView(APIView):
    @staticmethod
    def get(request, pk):
        try:
            book_issue = get_object_or_404(BookIssue, id=pk)
        except ValidationError:
            return JsonResponse({'error': 'invalid uuid'}, status=status.HTTP_400_BAD_REQUEST)
        book_issue_serializer = BookIssueSerializer(book_issue)
        return JsonResponse(book_issue_serializer.data)

    @staticmethod
    def delete(request, pk):
        try:
            book_issue = get_object_or_404(BookIssue, id=pk)
        except ValidationError:
            return JsonResponse({'error': 'invalid uuid'}, status=status.HTTP_400_BAD_REQUEST)
        book_issue.delete()
        return JsonResponse({'details': f'deleted issue record {pk}'})

    @staticmethod
    def patch(request, pk):
        try:
            book_issue = get_object_or_404(BookIssue, id=pk)
        except ValidationError:
            return JsonResponse({'error': 'invalid uuid'}, status=status.HTTP_400_BAD_REQUEST)
        data = JSONParser().parse(request)
        if data.get('status') == 0:
            book_issue.set_as_due()
        elif data.get('status') == 1:
            book_issue.set_as_returned()
        book_issue_serialize = BookIssueSerializer(book_issue)
        return JsonResponse(book_issue_serialize.data)

class BookIssueByUserView(APIView):
    @staticmethod
    def get(request, username):
        issues = BookIssue.objects.all()
        issue_status = request.GET.get('status', '')
        if issue_status.lower() == 'due':
            issues = BookIssue.objects.filter(status=0)
        elif issue_status.lower() == 'returned':
            issues = BookIssue.objects.filter(status=1)
        user = get_object_or_404(User, username=username)
        issues = issues.filter(user=user)
        issues_serializer = BookIssueSerializer(issues, many=True)
        return JsonResponse(issues_serializer.data, safe=False)