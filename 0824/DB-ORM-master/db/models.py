import sys
from django.db import models

class Director(models.Model):
    name = models.TextField(null=True)
    debut = models.DateTimeField(null=True)
    country = models.TextField(null=True)

class Genre(models.Model):
    title = models.TextField(null=True)