from django.shortcuts import render
from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.utils import timezone

# Create your views here.

@api_view(["GET"])
def health(request):
    return Response({"status": "ok", "message": "Hello, World!", "time": timezone.now().isoformat()})