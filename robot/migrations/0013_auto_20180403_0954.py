# Generated by Django 2.0.2 on 2018-04-03 06:54

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('robot', '0012_auto_20180330_2022'),
    ]

    operations = [
        migrations.CreateModel(
            name='Train',
            fields=[
                ('number', models.CharField(default='', max_length=6, primary_key=True, serialize=False, verbose_name='Номер рейса или номер поезда')),
                ('name', models.CharField(blank=True, default='', max_length=40, null=True, verbose_name='Название поезда или тип самолёта')),
                ('is_firm', models.BooleanField(default=False)),
                ('tuturu_id', models.CharField(default='', max_length=10, verbose_name='id поезда в системе tutu.ru')),
            ],
        ),
        migrations.RemoveField(
            model_name='route',
            name='car_description',
        ),
        migrations.RemoveField(
            model_name='route',
            name='carrier',
        ),
        migrations.RemoveField(
            model_name='route',
            name='route_number',
        ),
        migrations.AlterField(
            model_name='way',
            name='type',
            field=models.CharField(default='TRAIN', max_length=5),
        ),
        migrations.AddField(
            model_name='route',
            name='train',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='robot.Train'),
        ),
    ]
