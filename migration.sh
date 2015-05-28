#!/bin/bash

usage() {
  cat << EOF
Usage: $0 [option]
    -a : apply migration
    -e : export schema to Schemafile
EOF
}

REPO_ROOT=$(cd `dirname $0`;pwd)

args=`getopt ae $*`
if [ $? != 0 ]
then
  echo "Failed to getopt."
  exit 2
fi
set -- $args

for i
do
  case "$i"
  in
    -a)
      echo apply migration.; config=migration-apply.yml
      shift;;
    -e)
      echo export schema.; config=migration-export.yml
      shift;;
    --)
      if [ -z $config ]; then
        usage
        exit 1
      fi
      shift; break;;
  esac
done

echo --------------------
echo building images...
echo --------------------
docker-compose -f $REPO_ROOT/$config build

echo --------------------
echo run containers
echo --------------------
docker-compose -f $REPO_ROOT/$config up -d
sleep 3
if [ $config = "migration-export.yml" ]; then
  docker logs ridgepolesample_export_1 > $REPO_ROOT/Schemafile
elif [ $config = "migration-apply.yml" ]; then
  docker logs ridgepolesample_migration_1
fi
