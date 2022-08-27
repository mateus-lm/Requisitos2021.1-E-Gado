from rest_framework import status
from rest_framework.test import APITestCase
from .models import Pasture
from .serializers import PastureFarmSerializer


class PastureFarmTestCase(APITestCase):

    url = 'http://localhost:8000/' + 'pasture/'
    pastureUrl = '/pasture/'

    def setUp(self):
        self.pasture1 = Pasture.objects.create(
            area = 100.0, name = "Pasto Leste", farm = 4
            )

    def testPost(self):
        data = {
            'area': self.pasture1.area,
            'name': self.pasture1.name,
            'farm': self.pasture1.farm
        }
        response = self.client.post(self.url, data)
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)

    def testGet(self):
        # get API response
        response = self.client.get(self.url)
        # get data from DB
        pastures = Pasture.objects.all()
        # convert it to JSON
        serializer = PastureFarmSerializer(pastures, many=True)
        # check the status
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data, serializer.data)

    def testDelete(self):
        response = self.client.delete(
            self.url + str(self.pasture1.id) + '/', self.pasture1)
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)