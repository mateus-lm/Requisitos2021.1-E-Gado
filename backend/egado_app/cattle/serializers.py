from rest_framework import serializers
from .models import Cattle

    
class CattleSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = Cattle
        fields = ['type_cattle', 'id_cattle', 'gender', 'birth_day', 'weigth', 'qtd_milk', 'days_to_lactation', 'farm']