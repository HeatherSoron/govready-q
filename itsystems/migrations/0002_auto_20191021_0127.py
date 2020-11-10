# Generated by Django 2.2.4 on 2019-10-21 01:27

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('itsystems', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='agentservice',
            name='api_pw',
            field=models.CharField(blank=True, help_text="The user/login password for accessing Agent Service's API.", max_length=255, null=True),
        ),
        migrations.AlterField(
            model_name='agentservice',
            name='api_user',
            field=models.CharField(blank=True, help_text="The user/login identify for accessing Agent Service's API.", max_length=255, null=True),
        ),
        migrations.AlterField(
            model_name='hostinstance',
            name='host_type',
            field=models.CharField(blank=True, help_text='A categorization of the host.', max_length=24, null=True),
        ),
        migrations.AlterField(
            model_name='hostinstance',
            name='os',
            field=models.CharField(blank=True, help_text='The Operating System running on the Host Instance.', max_length=155, null=True),
        ),
        migrations.AlterField(
            model_name='systeminstance',
            name='sdlc_stage',
            field=models.CharField(blank=True, help_text='The stage of the System Development Life Cycle System is in.', max_length=24, null=True),
        ),
    ]