#!/bin/shell

echo "CONN_STRING=sys/Oracle123@oracle-db-container:1521/xepdb1" > ords/ords_secrets/conn_string.txt
rm -rf ords/ords_config/*
docker rm -f $(docker ps -a | grep oracle-db-ords-apex | awk '{print $1}')
docker compose up