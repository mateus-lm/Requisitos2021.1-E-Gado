from django.urls import path
from . import views

urlpatterns = [
    path('', views.FarmListAPIView.as_view(), name="farm_list"),
    path('<int:id>', views.FarmDetailAPIView.as_view(), name="farm_detail"),  
]