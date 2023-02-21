# Database info

## Postgres

See the compose file for config info

### Scripts

In order to run scripts from inside the container run the following command

```bash
podman exec -it postgres /bin/bash
```

There are a few scripts inside the container for convenience

```bash
# seeding the database with a dev schema
./database/scripts/seed_db.sh

# dropping the dev schema
./database/scripts/seed_db.sh
```

### Updating the seed

You can update the file /seed/dev.sql to change the seed data.

## PGAdmin

PGAdmin is a UI for visualizing the Postgres DB

See this [guide](https://onexlab-io.medium.com/docker-compose-postgres-database-seed-108297cac09a) for how to get it set up, under "How to test"
