from rest_framework.generics import GenericAPIView
from rest_framework.mixins import ListModelMixin, RetrieveModelMixin, UpdateModelMixin, DestroyModelMixin, \
    CreateModelMixin
from .serializers import SubjectSerializer, ExamSerializer, ResultSerializer, AttendanceSerializer, MarksSerializer
from .models import Marks, Subject, Exam, Result, Attendance
from rest_framework.permissions import IsAuthenticated
from django.http import JsonResponse
from rest_framework import status
from rest_framework.authtoken.models import Token
from rest_framework.decorators import api_view
from django.shortcuts import get_object_or_404, get_list_or_404
from django.contrib.auth import get_user_model

User = get_user_model()


# Views to fetch, delete and edit subjects
class SubjectView(GenericAPIView, ListModelMixin, CreateModelMixin):
    permission_classes = (IsAuthenticated,)
    queryset = Subject.objects.all()
    serializer_class = SubjectSerializer

    def post(self, request, *args, **kwargs):
        token = (request.headers['Authorization'].split()[1])
        token = Token.objects.get(key=token)
        if token.user.is_staff:
            return self.create(request, *args, **kwargs)
        return JsonResponse({'error': 'you are unauthorised, only staff can add subjects'},
                            status=status.HTTP_401_UNAUTHORIZED)

    def get(self, request, *args, **kwargs):
        return self.list(request, *args, **kwargs)


class SubjectDetailsView(RetrieveModelMixin, UpdateModelMixin, DestroyModelMixin, GenericAPIView):
    serializer_class = SubjectSerializer
    queryset = Subject.objects.all()
    permission_classes = (IsAuthenticated,)

    def get(self, request, *args, **kwargs):
        return self.retrieve(request, *args, **kwargs)

    def put(self, request, *args, **kwargs):
        token = (request.headers['Authorization'].split()[1])
        token = Token.objects.get(key=token)
        if token.user.is_staff:
            return self.update(request, *args, **kwargs)
        return JsonResponse({'error': 'you are unauthorised, only staff can edit subjects'},
                            status=status.HTTP_401_UNAUTHORIZED)

    def patch(self, request, *args, **kwargs):
        token = (request.headers['Authorization'].split()[1])
        token = Token.objects.get(key=token)
        if token.user.is_staff:
            return self.partial_update(request, *args, **kwargs)
        return JsonResponse({'error': 'you are unauthorised, only staff can edit subjects'},
                            status=status.HTTP_401_UNAUTHORIZED)

    def delete(self, request, *args, **kwargs):
        token = (request.headers['Authorization'].split()[1])
        token = Token.objects.get(key=token)
        if token.user.is_staff:
            return self.destroy(request, *args, **kwargs)
        return JsonResponse({'error': 'you are unauthorised, only staff can delete subjects'},
                            status=status.HTTP_401_UNAUTHORIZED)


# Views to fetch, delete and edit exams
class ExamView(GenericAPIView, ListModelMixin, CreateModelMixin):
    queryset = Exam.objects.all()
    serializer_class = ExamSerializer
    permission_classes = (IsAuthenticated,)

    def get(self, request, *args, **kwargs):
        return self.list(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        token = (request.headers['Authorization'].split()[1])
        token = Token.objects.get(key=token)
        if token.user.is_staff:
            return self.create(request, *args, **kwargs)
        return JsonResponse({'error': 'you are unauthorised, only staff can add exams'},
                            status=status.HTTP_401_UNAUTHORIZED)


class ExamDetailsView(GenericAPIView, RetrieveModelMixin, DestroyModelMixin, UpdateModelMixin):
    queryset = Exam.objects.all()
    serializer_class = ExamSerializer
    permission_classes = (IsAuthenticated,)

    def get(self, request, *args, **kwargs):
        return self.retrieve(request, *args, **kwargs)

    def put(self, request, *args, **kwargs):
        token = (request.headers['Authorization'].split()[1])
        token = Token.objects.get(key=token)
        if token.user.is_staff:
            return self.update(request, *args, **kwargs)
        return JsonResponse({'error': 'you are unauthorised, only staff can edit exams'},
                            status=status.HTTP_401_UNAUTHORIZED)

    def patch(self, request, *args, **kwargs):
        token = (request.headers['Authorization'].split()[1])
        token = Token.objects.get(key=token)
        if token.user.is_staff:
            return self.partial_update(request, *args, **kwargs)
        return JsonResponse({'error': 'you are unauthorised, only staff can edit exams'},
                            status=status.HTTP_401_UNAUTHORIZED)

    def delete(self, request, *args, **kwargs):
        token = (request.headers['Authorization'].split()[1])
        token = Token.objects.get(key=token)
        if token.user.is_staff:
            return self.destroy(request, *args, **kwargs)
        return JsonResponse({'error': 'you are unauthorised, only staff can delete exams'},
                            status=status.HTTP_401_UNAUTHORIZED)


# Views to fetch, delete and edit results
class ResultView(ListModelMixin, CreateModelMixin, GenericAPIView):
    permission_classes = (IsAuthenticated,)
    queryset = Result.objects.all()
    serializer_class = ResultSerializer

    def get(self, request, *args, **kwargs):
        return self.list(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        token = (request.headers['Authorization'].split()[1])
        token = Token.objects.get(key=token)
        if token.user.is_staff:
            return self.create(request, *args, **kwargs)
        return JsonResponse({'error': 'you are unauthorised, only staff can add results'},
                            status=status.HTTP_401_UNAUTHORIZED)


class ResultDetailsView(RetrieveModelMixin, DestroyModelMixin, UpdateModelMixin, GenericAPIView):
    permission_classes = (IsAuthenticated,)
    serializer_class = ResultSerializer
    queryset = Result.objects.all()

    def get(self, request, *args, **kwargs):
        return self.retrieve(request, *args, **kwargs)

    def put(self, request, *args, **kwargs):
        token = (request.headers['Authorization'].split()[1])
        token = Token.objects.get(key=token)
        if token.user.is_staff:
            return self.update(request, *args, **kwargs)
        return JsonResponse({'error': 'you are unauthorised, only staff can edit results'},
                            status=status.HTTP_401_UNAUTHORIZED)

    def patch(self, request, *args, **kwargs):
        token = (request.headers['Authorization'].split()[1])
        token = Token.objects.get(key=token)
        if token.user.is_staff:
            return self.partial_update(request, *args, **kwargs)
        return JsonResponse({'error': 'you are unauthorised, only staff can edit results'},
                            status=status.HTTP_401_UNAUTHORIZED)

    def delete(self, request, *args, **kwargs):
        token = (request.headers['Authorization'].split()[1])
        token = Token.objects.get(key=token)
        if token.user.is_staff:
            return self.destroy(request, *args, **kwargs)
        return JsonResponse({'error': 'you are unauthorised, only staff can delete results'},
                            status=status.HTTP_401_UNAUTHORIZED)


# Views to fetch, delete and edit attendance
class AttendanceView(GenericAPIView, ListModelMixin, CreateModelMixin):
    permission_classes = (IsAuthenticated,)
    serializer_class = AttendanceSerializer
    queryset = Attendance.objects.all()

    def get(self, request, *args, **kwargs):
        return self.list(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        token = (request.headers['Authorization'].split()[1])
        token = Token.objects.get(key=token)
        if token.user.is_staff:
            return self.create(request, *args, **kwargs)
        return JsonResponse({'error': 'you are unauthorised, only staff can add attendance'},
                            status=status.HTTP_401_UNAUTHORIZED)


class AttendanceDetailsView(RetrieveModelMixin, DestroyModelMixin, UpdateModelMixin, GenericAPIView):
    permission_classes = (IsAuthenticated,)
    serializer_class = AttendanceSerializer
    queryset = Attendance.objects.all()

    def get(self, request, *args, **kwargs):
        return self.retrieve(request, *args, **kwargs)

    def put(self, request, *args, **kwargs):
        token = (request.headers['Authorization'].split()[1])
        token = Token.objects.get(key=token)
        if token.user.is_staff:
            return self.update(request, *args, **kwargs)
        return JsonResponse({'error': 'you are unauthorised, only staff can edit attendance'},
                            status=status.HTTP_401_UNAUTHORIZED)

    def patch(self, request, *args, **kwargs):
        token = (request.headers['Authorization'].split()[1])
        token = Token.objects.get(key=token)
        if token.user.is_staff:
            return self.partial_update(request, *args, **kwargs)
        return JsonResponse({'error': 'you are unauthorised, only staff can edit attendance'},
                            status=status.HTTP_401_UNAUTHORIZED)

    def delete(self, request, *args, **kwargs):
        token = (request.headers['Authorization'].split()[1])
        token = Token.objects.get(key=token)
        if token.user.is_staff:
            return self.destroy(request, *args, **kwargs)
        return JsonResponse({'error': 'you are unauthorised, only staff can delete attendance'},
                            status=status.HTTP_401_UNAUTHORIZED)


# Marks Views
class MarksView(GenericAPIView, ListModelMixin, CreateModelMixin):
    permission_classes = (IsAuthenticated,)
    queryset = Marks.objects.all()
    serializer_class = MarksSerializer

    def post(self, request, *args, **kwargs):
        token = (request.headers['Authorization'].split()[1])
        token = Token.objects.get(key=token)
        if token.user.is_staff:
            return self.create(request, *args, **kwargs)
        return JsonResponse({'error': 'you are unauthorised, only staff can add marks'},
                            status=status.HTTP_401_UNAUTHORIZED)

    def get(self, request, *args, **kwargs):
        marks = Marks.objects.all()
        marks_serializer = MarksSerializer(marks, many=True)
        return JsonResponse(marks_serializer.data, safe=False)


class MarksDetailsView(RetrieveModelMixin, UpdateModelMixin, DestroyModelMixin, GenericAPIView):
    serializer_class = MarksSerializer
    queryset = Marks.objects.all()
    permission_classes = (IsAuthenticated,)

    def get(self, request, *args, **kwargs):
        data = self.retrieve(request, *args, **kwargs).data
        return JsonResponse(data)

    def put(self, request, *args, **kwargs):
        token = (request.headers['Authorization'].split()[1])
        token = Token.objects.get(key=token)
        if token.user.is_staff:
            return self.update(request, *args, **kwargs)
        return JsonResponse({'error': 'you are unauthorised, only staff can edit marks'},
                            status=status.HTTP_401_UNAUTHORIZED)

    def patch(self, request, *args, **kwargs):
        token = (request.headers['Authorization'].split()[1])
        token = Token.objects.get(key=token)
        if token.user.is_staff:
            return self.partial_update(request, *args, **kwargs)
        return JsonResponse({'error': 'you are unauthorised, only staff can edit marks'},
                            status=status.HTTP_401_UNAUTHORIZED)

    def delete(self, request, *args, **kwargs):
        token = (request.headers['Authorization'].split()[1])
        token = Token.objects.get(key=token)
        if token.user.is_staff:
            return self.destroy(request, *args, **kwargs)
        return JsonResponse({'error': 'you are unauthorised, only staff can delete marks'},
                            status=status.HTTP_401_UNAUTHORIZED)


@api_view(['GET'])
def get_attendance_by_user(req, username):
    user = get_object_or_404(User, username=username)
    attendance = get_list_or_404(Attendance, student=user)
    serializer = AttendanceSerializer(attendance, many=True)
    return JsonResponse(serializer.data, safe=False)


@api_view(['GET'])
def get_results_by_user(_, username):
    user = get_object_or_404(User, username=username)
    results = get_list_or_404(Result, student=user)
    serializer = ResultSerializer(results, many=True)
    return JsonResponse(serializer.data, safe=False)
