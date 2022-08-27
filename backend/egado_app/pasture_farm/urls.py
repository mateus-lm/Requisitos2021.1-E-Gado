from django.urls import path
from . import views

urlpatterns = [
    path('', views.PastureFarmListAPIView.as_view(), name="farm_list"),
    path('<int:id>', views.PastureFarmDetailAPIView.as_view(), name="farm_detail"),  
]