#!/usr/bin/env bash
set -e

echo "Waiting for postgres to connect ..."

while ! nc -z truck_signs_db 5432; do
  sleep 0.1
done

echo "PostgreSQL is active"

python manage.py collectstatic --noinput
python manage.py makemigrations
python manage.py migrate

echo "Postgresql migrations finished"

echo "Create DJANGO_SUPERUSER"

python manage.py shell << END
import os
from django.contrib.auth import get_user_model

User = get_user_model()
username = os.environ.get("SUPERUSER_USERNAME")
email = os.environ.get("SUPERUSER_EMAIL")
password = os.environ.get("SUPERUSER_PASSWORD")

if username and not User.objects.filter(username=username).exists():
    User.objects.create_superuser(username, email, password)
    print("Superuser created")
if not username:
    print("No superuser created, username not specified")
if not email:
    print("No superuser created, email not specified")
if not password:
    print("No superuser created, password not specified")
END

gunicorn truck_signs_designs.wsgi:application --bind 0.0.0.0:5000
