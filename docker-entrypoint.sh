#!/bin/sh
set -e

if [ -f /run/secrets/mysql_password ]; then
  export SPRING_DATASOURCE_PASSWORD=$(cat /run/secrets/mysql_password)
fi

exec java -jar /app/app.jar