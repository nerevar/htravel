# Generated by Django 2.0.2 on 2018-04-11 08:22

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('robot', '0017_jsondump_routearchive'),
    ]

    operations = [
        migrations.AlterField(
            model_name='route',
            name='request_date',
            field=models.DateTimeField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='routearchive',
            name='request_date',
            field=models.DateTimeField(blank=True, null=True),
        ),
    ]