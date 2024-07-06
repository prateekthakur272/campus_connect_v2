"""
URL configuration for campus_connect project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from rest_framework.authtoken.views import obtain_auth_token
from django.urls import path
from rest_framework.routers import DefaultRouter
import core.views as core_views
from academics.views import (ResultDetailsView, ResultView, SubjectView, SubjectDetailsView, ExamView, ExamDetailsView,
                             AttendanceView, AttendanceDetailsView, MarksView, MarksDetailsView, get_attendance_by_user,
                             get_results_by_user, )
from syllabus.views import (get_syllabus, get_syllabus_attachment, get_syllabus_by_id)
from library.views import BooksView, BookDetailView, BookIssuesView, BookIssueDetailView, BookIssueByUserView

router = DefaultRouter()
router.register(r'feedback', core_views.FeedbackViewSet, basename='Feedback')
urlpatterns = router.urls

urlpatterns += [
    path('admin/', admin.site.urls, name='Admin site'),
    # Authentication
    path('auth/api-auth-token/', obtain_auth_token, name='Api auth token'),
    path('auth/login/', core_views.login, name='Login'),
    path('auth/get-user/', core_views.get_user, name='Get user'),
    path('auth/get-user-by-id/<int:id>/', core_views.get_user_by_id, name='Get user'),
    path('auth/logout/', core_views.logout, name='Logout'),
    path('auth/register/', core_views.register, name='Register'),
    path('auth/change-password/', core_views.change_password, name='Change password'),
    path('auth/change-details/', core_views.change_details, name='Change details'),
    # Notifications
    path('notifications/', core_views.NotificationView.as_view()),
    # Academics/Subject
    path('subject/', SubjectView.as_view()),
    path('subject/<int:pk>/', SubjectDetailsView.as_view()),
    # Academics/Exam
    path('exam/', ExamView.as_view()),
    path('exam/<int:pk>/', ExamDetailsView.as_view()),
    # Academics/Result
    path('result/', ResultView.as_view()),
    path('result/<int:pk>/', ResultDetailsView.as_view()),
    path('my-results/<str:username>/', get_results_by_user),
    # Academics/Attendance
    path('attendance/', AttendanceView.as_view()),
    path('attendance/<int:pk>/', AttendanceDetailsView.as_view()),
    path('my-attendance/<str:username>/', get_attendance_by_user),
    # Academics/Marks
    path('marks/', MarksView.as_view()),
    path('marks/<int:pk>/', MarksDetailsView.as_view()),
    # Academics/Syllabus
    path('syllabus/', get_syllabus),
    path('uploads/syllabus/<int:id>/', get_syllabus_attachment),
    path('syllabus/<int:id>/', get_syllabus_by_id),
    # Library/Books
    path('books/', BooksView.as_view()),
    path('books/<str:pk>', BookDetailView.as_view()),
    path('issues/', BookIssuesView.as_view()),
    path('issues/<str:username>', BookIssueByUserView.as_view()),
    path('issues/<str:pk>', BookIssueDetailView.as_view()),
]
