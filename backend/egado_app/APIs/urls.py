from django.urls import path, include
from django.urls.resolvers import URLPattern
from .views import List_UserFarmer, Detail_UserFarmer

urlpatterns = [
    path('', List_UserFarmer.as_view()),
    path('<int:pk>/', Detail_UserFarmer.as_view())
]
