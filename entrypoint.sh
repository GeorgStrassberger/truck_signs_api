#!/usr/bin/env bash

set -e

echo "Waiting for postgres to connect ..."

while ! nc -z truck_signs_db 5432; do
  sleep 1
done

echo "PostgreSQL is active"

python manage.py collectstatic --noinput

python manage.py makemigrations
python manage.py migrate

echo "Postgresql migrations finished"

# Erstellen des Superusers für die Django Admin-Oberfläche
python manage.py createsuper

gunicorn truck_signs_designs.wsgi:application --bind 0.0.0.0:5000
