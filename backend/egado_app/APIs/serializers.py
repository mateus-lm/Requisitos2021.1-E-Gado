from django.db.models import fields
from rest_framework import serializers
from user_farmer import models


class UserSerializer(serializers.ModelSerializer):
    user_farmer = serializers.PrimaryKeyRelatedField(many=True, queryset = models.UserFarmer.objects.all())
    isAuth = serializers.ReadOnlyField(source='isAuth.username')
    class Meta:
        fields = (
            'id',
            'name',
            'gender',
            'isAuth',
            'user_farmer',
        )
        model = models.UserFarmer