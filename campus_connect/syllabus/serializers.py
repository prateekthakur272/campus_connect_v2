from rest_framework.serializers import ModelSerializer
from rest_framework import fields
from .models import Syllabus

class SyllabusSerializer(ModelSerializer):
    class Meta:
        model = Syllabus
        fields = ('title','id',)
