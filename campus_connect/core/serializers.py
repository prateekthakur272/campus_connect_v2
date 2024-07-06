from django.contrib.auth import get_user_model
from rest_framework.serializers import ModelSerializer
from .models import Feedback, Notification

User = get_user_model()

class UserSerializer(ModelSerializer):
    class Meta:
        model = User
        fields = ('username', 'email', 'first_name', 'last_name',)


class UserSerializerWithStaffAndAdminStatus(ModelSerializer):
     class Meta:
        model = User
        fields = ('username', 'email', 'first_name', 'last_name', 'is_staff', 'is_superuser', 'github', 'linkedin', 'phone')


class FeedbackSerializer(ModelSerializer):
    class Meta:
        model = Feedback
        fields = ('id' ,'title', 'description', 'email', 'date_time')
        
        
class NotificationSerializer(ModelSerializer):
    class Meta:
        model = Notification
        fields = ('id', 'title', 'description', 'date_time')