# promise-postgres

```sh
docker exec -i promise-postgres /bin/bash -c "PGPASSWORD=$POSTGRES_PASSWORD pg_dump --username $POSTGRES_USER $POSTGRES_DB" > ./pg_dump.sql
```
