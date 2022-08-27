from django.db import models

# Create your models here.

class Pasture(models.Model):

    id = models.AutoField(primary_key=True)
    area = models.FloatField(null=False, blank=False)
    name = models.CharField(null=False, blank=False, max_length=200)
    farm = models.IntegerField(default=1)

    def __str__(self):
        return str(self.name)