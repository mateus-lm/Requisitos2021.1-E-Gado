from django.shortcuts import render

# Create your views here.
from user_farmer import models
from .serializers import UserSerializer
from rest_framework import generics

class List_UserFarmer(generics.ListCreateAPIView):
    queryset = models.UserFarmer.objects.all()
    serializer_class = UserSerializer

class Detail_UserFarmer(generics.RetrieveUpdateDestroyAPIView):
    queryset = models.UserFarmer.objects.all()
    serializer_class = UserSerializer