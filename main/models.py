# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Cell(models.Model):
    day = models.BigIntegerField(db_column='Day')  # Field name made lowercase.
    student_group = models.ForeignKey('StudentGroup', models.DO_NOTHING, db_column='Student_Group_id')  # Field name made lowercase.
    subject_code = models.ForeignKey('Subject', models.DO_NOTHING, db_column='Subject_Code')  # Field name made lowercase.
    room = models.ForeignKey('Room', models.DO_NOTHING, db_column='Room')  # Field name made lowercase.
    pair = models.ForeignKey('Pair', models.DO_NOTHING, db_column='Pair')  # Field name made lowercase.
    teacher_pk = models.ForeignKey('Teacher', models.DO_NOTHING, db_column='Teacher_pk')  # Field name made lowercase.
    event = models.TextField(db_column='Event', blank=True, null=True)  # Field name made lowercase.
    id = models.BigAutoField(primary_key=True)

    class Meta:
        managed = False
        db_table = 'cell'


class Pair(models.Model):
    number = models.BigIntegerField(primary_key=True)

    class Meta:
        managed = False
        db_table = 'pair'


class Room(models.Model):
    id = models.BigIntegerField(primary_key=True)
    name = models.CharField()

    class Meta:
        managed = False
        db_table = 'room'

    def __str__(self):
        return self.name

class ScheduleUser(models.Model):
    id = models.BigAutoField(primary_key=True)
    username = models.CharField()
    password = models.CharField()
    role = models.CharField()
    last_login = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'schedule_user'

    def is_authenticated(self):
        return self.last_login is not None


class Student(models.Model):
    student = models.OneToOneField(ScheduleUser, models.DO_NOTHING, primary_key=True)
    name = models.CharField()
    student_group = models.ForeignKey('StudentGroup', models.DO_NOTHING, db_column='student_group')

    class Meta:
        managed = False
        db_table = 'student'

    def __str__(self):
        return self.name


class StudentGroup(models.Model):
    id = models.BigIntegerField(primary_key=True)
    name = models.CharField()

    class Meta:
        managed = False
        db_table = 'student_group'

    def __str__(self):
        return self.name

class Study(models.Model):
    subject_code = models.CharField()
    student_group_id = models.BigIntegerField()

    class Meta:
        managed = False
        db_table = 'study'


class Subject(models.Model):
    code = models.CharField(primary_key=True)
    name = models.TextField()

    class Meta:
        managed = False
        db_table = 'subject'
    def __str__(self):
        return self.name


class Taught(models.Model):
    subject_code = models.OneToOneField(Subject, models.DO_NOTHING, db_column='subject_code', primary_key=True)  # The composite primary key (subject_code, teacher_id) found, that is not supported. The first column is selected.
    teacher = models.ForeignKey('Teacher', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'taught'
        unique_together = (('subject_code', 'teacher'),)


class Teacher(models.Model):
    teacher = models.OneToOneField(ScheduleUser, models.DO_NOTHING, primary_key=True)
    name = models.CharField()
    degree = models.CharField()

    class Meta:
        managed = False
        db_table = 'teacher'

    def __str__(self):
        return self.name