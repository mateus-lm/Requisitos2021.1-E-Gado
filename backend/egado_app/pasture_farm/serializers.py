from rest_framework import serializers
from .models import Pasture

class PastureFarmSerializer(serializers.ModelSerializer):
    class Meta:
        model = Pasture
        fields = '__all__'