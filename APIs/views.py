from django.shortcuts import render


# Create your views here.
from user_farmer import models
from .serializers import UserSerializer
from rest_framework import generics
from rest_framework import permissions

class List_UserFarmer(generics.ListCreateAPIView):
    queryset = models.UserFarmer.objects.all()
    serializer_class = UserSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]

    def perform_create(self, serializer):
        serializer.save(isAuth=self.request.user)

class Detail_UserFarmer(generics.RetrieveUpdateDestroyAPIView):
    queryset = models.UserFarmer.objects.all()
    serializer_class = UserSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]