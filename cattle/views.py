from django.shortcuts import render
from rest_framework.generics import ListCreateAPIView, RetrieveUpdateDestroyAPIView
from .serializers import CattleSerializer
from .models import Cattle
from rest_framework import permissions
from .permissions import IsOwner
# Create your views here.

class CattleListAPIView(ListCreateAPIView):
    serializer_class = CattleSerializer
    queryset = Cattle.objects.all()
    permissions = (permissions.IsAuthenticated,)

    def perform_create(self, serializer):
        return serializer.save(owner = self.request.user)

    def get_queryset(self):
        return self.queryset.filter(owner=self.request.user)
    
class CattleDetailAPIView(RetrieveUpdateDestroyAPIView):
    serializer_class = CattleSerializer
    queryset = Cattle.objects.all()
    permissions = (permissions.IsAuthenticated, IsOwner,)
    lookup_field = "id"

    def perform_create(self, serializer):
        return serializer.save(owner = self.request.user)

    def get_queryset(self):
        return self.queryset.filter(owner=self.request.user)