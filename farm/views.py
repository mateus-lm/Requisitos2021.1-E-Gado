from django.shortcuts import render

# Create your views here.
from rest_framework.generics import ListCreateAPIView, RetrieveUpdateDestroyAPIView
from .models import Farm
from .serializers import FarmSerializer
from rest_framework import permissions
from .permissions import IsOwner

class FarmListAPIView(ListCreateAPIView):
    serializer_class = FarmSerializer
    queryset = Farm.objects.all()
    permission_classes = (permissions.IsAuthenticated,)

    def perform_create(self, serializer):
        return serializer.save(owner=self.request.user)

    def get_queryset(self):
        return self.queryset.filter(owner=self.request.user)
    
class FarmDetailAPIView(RetrieveUpdateDestroyAPIView):
    serializer_class = FarmSerializer
    queryset = Farm.objects.all()
    permission_classes = (permissions.IsAuthenticated, IsOwner,)
    lookup_field = "id"

    def perform_create(self, serializer):
        return serializer.save(owner = self.request.user)

    def get_queryset(self):
        return self.queryset.filter(owner=self.request.user)