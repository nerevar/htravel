# Generated by Django 2.0.2 on 2018-03-11 14:01

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('robot', '0009_auto_20180227_2227'),
    ]

    operations = [
        migrations.AddField(
            model_name='city',
            name='name',
            field=models.CharField(default='', max_length=50),
            preserve_default=False,
        ),
    ]
