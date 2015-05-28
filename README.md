ridgepole-sample
=============

# Migration

## Setup
```sh
$ ./bootstrap.sh
```

## Migration steps
1. execute commands as `CREATE TABLE`, `ALTER TABLE` at docker container.
```sql
CREATE TABLE articles (
  title varchar NOT NULL,
  status char(1) NOT NULL DEFAULT '1',
  created_at timestamp NOT NULL DEFAULT '1970-01-01 00:00:00 UTC',
  updated_at timestamp NOT NULL DEFAULT '1970-01-01 00:00:00 UTC'
);
```

1. run docker container for export and update Schemafile.  
```sh
$ ./migration.sh -e
```

## Options
```sh
Usage: ./migration.sh [option]
    -a : apply migration
    -e : export schema to migration/Schemafile
