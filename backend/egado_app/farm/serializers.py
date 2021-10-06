from rest_framework import serializers
from .models import Farm

class FarmSerializer(serializers.ModelSerializer):
    # cattles = serializers.StringRelatedField(many = True)
    # incomes = serializers.StringRelatedField(many = True)
    class Meta:
        model = Farm
        fields = ['id', 'name_farm', 'city', 'state', 'tam']