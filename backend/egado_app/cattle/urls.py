from django.urls import path
from . import views

urlpatterns = [
    path('', views.CattleListAPIView.as_view(), name="cattle_list"),
    path('<int:id>', views.CattleDetailAPIView.as_view(), name="cattle_detail"),  
]