from django.db import models
import cx_Oracle
from django.conf import settings
# Create your models here.
class Mem_id(models.Model):
    dsn = cx_Oracle.makedsn("211.183.2.63", 1521, "xe")
    con = cx_Oracle.connect("s20200101", "tiger", dsn)
    cursor = con.cursor()
    cursor.execute("""SELECT mem_id from members""")
    def __str__(self):
        return self.cursor.mem_id

class UploadFileModel(models.Model):
    title = models.TextField(default='asd')
    file = models.FileField(upload_to=settings.MEDIA_ROOT)

class Post(models.Model):
    title = models.CharField(max_length=100)
    file = models.ImageField(blank=True)