from django.db import models

# Create your models here.
from farm.models import Farm
from user_farmer.models import User

class Income(models.Model):
    INPUT_TYPE = [
        ('LUCRO', 'LUCRO'),
        ('DESPESA', 'DESPESA')
    ]

    income_type = models.CharField(choices=INPUT_TYPE, max_length=255)
    value = models.CharField(max_length=255)
    date = models.DateField(null = False, blank = False)
    description = models.CharField(max_length=255)

    farm = models.ForeignKey(Farm, related_name='incomes', on_delete=models.CASCADE)

    owner = models.ForeignKey(to = User, on_delete = models.CASCADE)

    # def __str__(self):
    #     return self.income_type
