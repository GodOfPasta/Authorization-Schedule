from django.contrib import admin
from .models import Cell
from .models import Pair
from .models import Room
from .models import ScheduleUser
from .models import Student
from .models import StudentGroup
from .models import Study
from .models import Subject
from .models import Taught
from .models import Teacher


admin.site.register(Cell)
admin.site.register(Pair)
admin.site.register(Room)
admin.site.register(ScheduleUser)
admin.site.register(Student)
admin.site.register(StudentGroup)
admin.site.register(Study)
admin.site.register(Subject)
admin.site.register(Taught)
admin.site.register(Teacher)
