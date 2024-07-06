# Generated by Django 4.2.5 on 2023-11-15 16:39

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Syllabus',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=200)),
                ('file', models.FileField(help_text='Upload .pdf files only', upload_to='uploads/syllabus')),
            ],
            options={
                'verbose_name': 'Syllabus',
                'verbose_name_plural': 'Syllabus',
            },
        ),
    ]