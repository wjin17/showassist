#!/bin/bash

SCHEMAS=`psql -U $POSTGRES_USER -a -c 'SELECT schema_name FROM information_schema.schemata'`

if echo $SCHEMAS | grep dev; then
    echo "DB already seeded, drop the dev schema to reseed."
else
    psql -U $POSTGRES_USER -a -f /database/seed/dev.sql
    echo "DB successfully seeded"
fi

echo "finito"