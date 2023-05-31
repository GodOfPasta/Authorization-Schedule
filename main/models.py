# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.BooleanField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.BooleanField()
    is_active = models.BooleanField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class Cell(models.Model):
    day = models.BigIntegerField(db_column='Day')  # Field name made lowercase.
    student_group = models.ForeignKey('StudentGroup', models.DO_NOTHING, db_column='Student_Group_id')  # Field name made lowercase.
    subject_code = models.ForeignKey('Subject', models.DO_NOTHING, db_column='Subject_Code')  # Field name made lowercase.
    room = models.ForeignKey('Room', models.DO_NOTHING, db_column='Room')  # Field name made lowercase.
    pair = models.ForeignKey('Pair', models.DO_NOTHING, db_column='Pair')  # Field name made lowercase.
    teacher_pk = models.ForeignKey('Teacher', models.DO_NOTHING, db_column='Teacher_pk')  # Field name made lowercase.
    event = models.TextField(db_column='Event', blank=True, null=True)  # Field name made lowercase.
    id = models.BigAutoField(primary_key=True)

    def get_absolute_url(self):
        return '/teacher_schedule'

    class Meta:
        managed = False
        db_table = 'cell'


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.SmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    id = models.BigAutoField(primary_key=True)
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class MainStudent(models.Model):
    id = models.BigAutoField(primary_key=True)
    name = models.CharField(max_length=20)

    class Meta:
        managed = False
        db_table = 'main_student'


class Pair(models.Model):
    number = models.BigIntegerField(primary_key=True)

    class Meta:
        managed = False
        db_table = 'pair'


class Room(models.Model):
    id = models.BigIntegerField(primary_key=True)
    name = models.CharField(max_length=20)

    def __str__(self): return self.name

    class Meta:
        managed = False
        db_table = 'room'


class ScheduleUser(models.Model):
    id = models.BigAutoField(primary_key=True)
    login = models.CharField(max_length=20)
    password = models.CharField(max_length=20)
    role = models.CharField(max_length=20)

    class Meta:
        managed = False
        db_table = 'schedule_user'


class Student(models.Model):
    student = models.OneToOneField(ScheduleUser, models.DO_NOTHING, primary_key=True)
    name = models.CharField(max_length=20)
    student_group = models.ForeignKey('StudentGroup', models.DO_NOTHING, db_column='student_group')

    class Meta:
        managed = False
        db_table = 'student'


class StudentGroup(models.Model):
    id = models.BigIntegerField(primary_key=True)
    name = models.CharField(max_length=20)

    class Meta:
        managed = False
        db_table = 'student_group'


class Study(models.Model):
    subject_code = models.CharField(max_length=20)
    student_group_id = models.BigIntegerField()

    class Meta:
        managed = False
        db_table = 'study'


class Subject(models.Model):
    code = models.CharField(primary_key=True, max_length=20)
    name = models.TextField()

    def __str__(self): return self.name

    class Meta:
        managed = False
        db_table = 'subject'


class Taught(models.Model):
    subject_code = models.OneToOneField(Subject, models.DO_NOTHING, db_column='subject_code', primary_key=True)
    teacher = models.ForeignKey('Teacher', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'taught'
        unique_together = (('subject_code', 'teacher'),)


class Teacher(models.Model):
    teacher = models.OneToOneField(ScheduleUser, models.DO_NOTHING, primary_key=True)
    name = models.CharField(max_length=20)
    degree = models.CharField(max_length=20)

    def __str__(self): return self.name

    class Meta:
        managed = False
        db_table = 'teacher'
