# Generated by Django 2.0.2 on 2018-02-25 09:45

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('robot', '0006_auto_20180225_1223'),
    ]

    operations = [
        migrations.CreateModel(
            name='Way',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('type', models.CharField(choices=[('TRAIN', 'Train'), ('PLANE', 'Airplane')], default='TRAIN', max_length=5)),
                ('from_city', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='from_city', to='robot.City')),
                ('to_city', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='to_city', to='robot.City')),
            ],
        ),
        migrations.RemoveField(
            model_name='trip',
            name='route',
        ),
        migrations.RemoveField(
            model_name='price',
            name='trip',
        ),
        migrations.RemoveField(
            model_name='route',
            name='from_city',
        ),
        migrations.RemoveField(
            model_name='route',
            name='to_city',
        ),
        migrations.RemoveField(
            model_name='route',
            name='type',
        ),
        migrations.AddField(
            model_name='price',
            name='route',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='robot.Route'),
        ),
        migrations.AddField(
            model_name='route',
            name='arrive',
            field=models.DateTimeField(null=True),
        ),
        migrations.AddField(
            model_name='route',
            name='car_description',
            field=models.CharField(blank=True, default='', max_length=40, null=True, verbose_name='Название поезда или тип самолёта'),
        ),
        migrations.AddField(
            model_name='route',
            name='carrier',
            field=models.CharField(blank=True, max_length=40, null=True, verbose_name='Перевозчик'),
        ),
        migrations.AddField(
            model_name='route',
            name='departure',
            field=models.DateTimeField(null=True),
        ),
        migrations.AddField(
            model_name='route',
            name='duration',
            field=models.DurationField(null=True),
        ),
        migrations.AddField(
            model_name='route',
            name='request_date',
            field=models.DateTimeField(auto_now_add=True, null=True),
        ),
        migrations.AddField(
            model_name='route',
            name='route_number',
            field=models.CharField(default='', max_length=6, verbose_name='Номер рейса или номер поезда'),
        ),
        migrations.DeleteModel(
            name='Trip',
        ),
        migrations.AddField(
            model_name='route',
            name='way',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='robot.Way'),
        ),
    ]
