from django.shortcuts import render
from rest_framework.decorators import api_view
from .models import Syllabus
from django.http import FileResponse, JsonResponse
from django.shortcuts import get_object_or_404, get_list_or_404
from .serializers import SyllabusSerializer

@api_view(['GET'])
def get_syllabus_attachment(request,id):
    syllabus = get_object_or_404(Syllabus, id=id)
    return FileResponse(syllabus.file)

@api_view(['GET'])
def get_syllabus(request):
    syllabus = Syllabus.objects.all()
    serializer = SyllabusSerializer(syllabus, many = True)
    return JsonResponse(serializer.data, safe=False)

@api_view(['GET'])
def get_syllabus_by_id(request, id):
    syllabus = get_object_or_404(Syllabus, id=id)
    ser = SyllabusSerializer(syllabus)
    return JsonResponse(ser.data)