#!/bin/sh

set -e

bash handel_migrations.sh
exec gunicorn hypertube.wsgi:application --bind 0.0.0.0:8000
# exec $@