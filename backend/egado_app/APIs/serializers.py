from django.db.models import fields
from rest_framework import serializers
from user_farmer import models

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        fields = (
            'id',
            'name',
            'gender',
        )
        model = models.UserFarmer