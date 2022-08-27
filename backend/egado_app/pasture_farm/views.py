from .serializers import PastureFarmSerializer
from rest_framework.generics import ListCreateAPIView, RetrieveUpdateDestroyAPIView
from .models import Pasture
# Create your views here.

class PastureFarmListAPIView(ListCreateAPIView):
    serializer_class = PastureFarmSerializer
    queryset = Pasture.objects.all()

    def perform_create(self, serializer):
        return serializer.save()
    
class PastureFarmDetailAPIView(RetrieveUpdateDestroyAPIView):
    serializer_class = PastureFarmSerializer
    queryset = Pasture.objects.all()
    lookup_field = "id"

    def perform_create(self, serializer):
        return serializer.save()