from django.contrib import admin
from .models import Book, BookIssue


@admin.register(Book)
class BookAdmin(admin.ModelAdmin):
    list_display = ('title', 'author', 'publication', 'available')
    list_filter = ('author', 'publication', 'available')
    search_fields = ('title', 'author', 'publication',)

    
@admin.register(BookIssue)
class BookAdmin(admin.ModelAdmin):
    list_display = ('id', 'user', 'book', 'issue_date', 'status')
    list_filter = ('status',)
    search_fields = ('id', 'user__first_name', 'user__last_name', 'book__title', 'book__author',)
    autocomplete_fields = ('user', 'book',)

