from django.db import models
from user_farmer.models import User
# Create your models here.

class Cattle(models.Model):

    CATEGORY_CATTLE = [
        ('GADO_LEITEIRO', 'GADO_LEITEIRO'),
        ('GADO_CORTE', 'GADO_CORTE')
    ]
    GENDER = [
        ('FEMALE', 'FEMALE'),
        ('MALE', 'MALE')
    ]

    type_cattle = models.CharField(choices=CATEGORY_CATTLE, max_length=255)
    id_cattle = models.CharField(max_length=255)
    gender = models.CharField(choices=GENDER, max_length=255)
    birth_day = models.DateField(null = False, blank = False)
    weigth = models.DecimalField(max_digits=6, decimal_places=4, max_length=255)
    qtd_milk = models.DecimalField(max_digits=6, decimal_places=4, max_length=255)
    days_to_lactation = models.DateField(null = False, blank = False)

    owner = models.ForeignKey(to = User, on_delete = models.CASCADE)

