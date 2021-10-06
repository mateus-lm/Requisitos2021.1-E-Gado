from django.db import models
from django.db.models.deletion import CASCADE
from user_farmer.models import User
# Create your models here.

class Farm(models.Model):
    name_farm = models.CharField(max_length=30)
    city = models.CharField(max_length=30)
    state = models.CharField(max_length=30)
    tam = models.CharField(max_length=30)

    owner = models.ForeignKey(to = User, on_delete = models.CASCADE)

    def __str__(self):
        return self.name_farm
