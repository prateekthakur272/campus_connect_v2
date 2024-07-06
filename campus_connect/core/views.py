from core.models import Feedback, Notification
from .serializers import UserSerializer, UserSerializerWithStaffAndAdminStatus
from rest_framework.decorators import api_view
from rest_framework.parsers import JSONParser
from django.shortcuts import get_object_or_404
from django.http import JsonResponse
from rest_framework import status, viewsets
from rest_framework.authtoken.models import Token
from datetime import datetime
from rest_framework.views import APIView
from .serializers import FeedbackSerializer, NotificationSerializer
from rest_framework.mixins import RetrieveModelMixin, ListModelMixin
from django.contrib.auth import get_user_model
from rest_framework.views import APIView

User = get_user_model()
json = JSONParser()

@api_view(['POST'])
def login(request):
    data = json.parse(request)
    user = get_object_or_404(User, username = data['username'])
    if not user.check_password(data['password']):
        return JsonResponse({"detail":"wrong password"}, status = status.HTTP_403_FORBIDDEN)
    token = Token.objects.get(user=user)
    user.last_login = datetime.now()
    user.save()
    serializer = UserSerializer(user)
    return JsonResponse({"token":token.key, "user":serializer.data}, status=status.HTTP_200_OK)


@api_view(['POST'])
def logout(request):
    return JsonResponse({"detail":"successfully logged out"}, status=status.HTTP_200_OK)


@api_view(['POST'])
def get_user(request):
    data = json.parse(request)
    token = get_object_or_404(Token, key=data['token'])
    user_serializer = UserSerializerWithStaffAndAdminStatus(token.user)
    return JsonResponse(user_serializer.data, status=status.HTTP_200_OK)


@api_view(['GET'])
def get_user_by_id(request, id):
    user = get_object_or_404(User, id=id)
    user_serializer = UserSerializerWithStaffAndAdminStatus(user)
    return JsonResponse(user_serializer.data, status=status.HTTP_200_OK)


@api_view(['POST'])
def register(request):
    data = json.parse(request)
    user_serializer = UserSerializer(data=data)
    if user_serializer.is_valid():
        user_serializer.save()
        user = User.objects.get(username=data['username'])
        user.set_password(data['password'])
        user.save()
        return JsonResponse(user_serializer.data,status=status.HTTP_201_CREATED)
    return JsonResponse(user_serializer.errors,status=status.HTTP_400_BAD_REQUEST)

@api_view(['POST'])
def change_password(request):
    data = json.parse(request)
    user = get_object_or_404(User, username=data['username'])
    try:
        if user.check_password(data['password']):
            user.set_password(data['new_password'])
            user.save()
            return JsonResponse({"detail":"password changed"}, status=status.HTTP_202_ACCEPTED)
    except KeyError:
        return JsonResponse({"detail":"required [username, password, new_password]"})
    return JsonResponse({}, status=status.HTTP_400_BAD_REQUEST)

@api_view(['POST'])
def change_details(request):
    data = json.parse(request)
    token = get_object_or_404(Token, key = data['token'])
    user = token.user
    if(data.get('email')):
        user.change_email(data['email'])
    if(data.get('phone')):
        user.change_phone(data['phone'])
    if(data.get('github')):
        user.change_github(data['github'])
    if(data.get('linkedin')):
        user.change_linkedin(data['linkedin'])
    return JsonResponse({'detail':'changes saved'}, status=status.HTTP_202_ACCEPTED)

class FeedbackView(APIView):
    queryset = Feedback.objects.all()

    serializer_class = FeedbackSerializer
    def get(self, request, *args, **kwargs):
        feedback_serializer = FeedbackSerializer(Feedback.objects.all(),many=True)
        return JsonResponse(feedback_serializer.data, safe=False)
    
    def post(self, request, *args, **kwargs):
        data = json.parse(request)
        feedback_serializer = FeedbackSerializer(data=data)
        if feedback_serializer.is_valid():
            feedback = feedback_serializer.save()
            return JsonResponse({"detail":"feedback sent"},status=status.HTTP_201_CREATED)
        return JsonResponse(feedback_serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
    @staticmethod
    @api_view(['GET'])
    def get_by_id(request, id):
        feedback = get_object_or_404(Feedback, id=id)
        feedback_serializer = FeedbackSerializer(feedback)
        return JsonResponse(feedback_serializer.data, status=status.HTTP_200_OK)
    

class FeedbackViewSet(ListModelMixin, RetrieveModelMixin, viewsets.GenericViewSet):
    serializer_class = FeedbackSerializer
    queryset = Feedback.objects.all()
    
    def create(self, request):
        data = json.parse(request)
        feedback_serializer = FeedbackSerializer(data=data)
        if feedback_serializer.is_valid():
            feedback = feedback_serializer.save()
            return JsonResponse({"detail":"feedback sent"},status=status.HTTP_201_CREATED)
        return JsonResponse(feedback_serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    

class NotificationView(APIView):
    @staticmethod
    def get(request):
       notifications = Notification.objects.all().order_by('-date_time')
       notification_serializer = NotificationSerializer(notifications, many=True)
       return JsonResponse(notification_serializer.data,safe=False)