from django.contrib.auth.backends import BaseBackend
from .models import ScheduleUser


class ScheduleUserBackend(BaseBackend):
    def authenticate(self, request, username=None, password=None, **kwargs):
        try:
            user = ScheduleUser.objects.get(username=username)
            if user.password == password:
                return user
        except ScheduleUser.DoesNotExist:
            return None

    def get_user(self, user_id):
        try:
            return ScheduleUser.objects.get(pk=user_id)
        except ScheduleUser.DoesNotExist:
            return None

    def user_can_authenticate(self, user):
        # Если вам необходимо добавить дополнительные проверки, чтобы определить, может ли пользователь аутентифицироваться
        return True