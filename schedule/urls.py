from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import path, include
from main import urls

urlpatterns = [
    path('', include('django.contrib.auth.urls')),
    path('admin/', admin.site.urls),
    path('', include(urls)),
] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
