#!/bin/sh
set -e

echo "Starting Spring Boot application..."
echo "Active profile: ${SPRING_PROFILES_ACTIVE:=dev}"

if [ "$SPRING_PROFILES_ACTIVE" = "dev" ]; then
  if [ -f /run/secrets/mysql_password ]; then
    export SPRING_DATASOURCE_PASSWORD="$(cat /run/secrets/mysql_password)"
    echo "Using MySQL password from secret"
  else
    echo "Warning: MySQL password secret not found!"
  fi
fi

if [ "$SPRING_PROFILES_ACTIVE" = "prod" ]; then
  if [ -f /run/secrets/postgres_password ]; then
    export SPRING_DATASOURCE_PASSWORD="$(cat /run/secrets/postgres_password)"
    echo "Using PostgreSQL password from secret"
  else
    echo "Warning: PostgreSQL password secret not found!"
  fi
fi

exec java -jar /app/app.jar --spring.profiles.active="$SPRING_PROFILES_ACTIVE"
