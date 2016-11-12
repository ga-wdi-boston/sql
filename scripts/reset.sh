#!/bin/sh

SQL_SCRIPT_ROOT="$(cd "$(dirname $0)" && pwd)"
PSQL_CMD="psql --pset=pager=off --set=ON_ERROR_STOP=true"
DATABASE="sql-crud"

$PSQL_CMD --file=- <<EOF
DROP DATABASE IF EXISTS "$DATABASE";
CREATE DATABASE "$DATABASE";
EOF

if [ $? -gt 0 ]; then
  echo Error creating database $DATABASE
  exit 1
fi

for script in ${SQL_SCRIPT_ROOT}/*/*; do
  $PSQL_CMD --file=${script} $DATABASE
  if [ $? -gt 0 ]; then
    echo Error running script: $script
    break
  fi
done
