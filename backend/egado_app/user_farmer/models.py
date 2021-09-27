from django.db import models

# Create your models here.

class UserFarmer(models.Model):
    #Variáveis que o usuário fazendeiro possui, como o nome da fazenda.
    GENDER_TYPE = (
        ('masculino', 'Masculino'),
        ('feminino', 'Feminino'),
    )

    name = models.CharField(max_length=50)
    gender = models.CharField(max_length=10, choices=GENDER_TYPE)

    # retornar a classe como nome caso seja chamada
    def __str__(self):
        return self.name