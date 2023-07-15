from django.contrib import admin
from django.contrib.auth.views import LogoutView
from django.urls import path, re_path, include, reverse

from django.contrib.auth import views as auth_views
from . import views
urlpatterns = [
    path('login/', views.my_login,name = 'login'),
    path('register/',views.my_register, name = 'register'),
    path('my_records/',views.my_records, name = 'my_records'),
    path('my_invoices/',views.my_invoice, name = 'my_invoices'),
    re_path(r'^my_invoices/(?P<invoice_id>\d+)/$', views.payment, name='payment'),
    path('logout/', LogoutView.as_view(next_page = 'users:login'), name='logout'),
    path('password_reset/Mptk/193gf89qhw1h3r834rh9123hr9fht412ht829fh/',views.reset,name = 'reset'),


]