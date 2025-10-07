@echo off
REM Crear el archivo conn_string.txt con los datos de conexión
echo CONN_STRING=sys/Oracle123@oracle-db-container:1521/xepdb1 > ords\ords_secrets\conn_string.txt

REM Eliminar el contenido del directorio ords\ords_config (excepto el directorio mismo)
rmdir /s /q ords\ords_config
mkdir ords\ords_config

REM Eliminar el contenedor con nombre que contiene "oracle-db-ords-apex"
FOR /F "tokens=*" %%i IN ('docker ps -a --filter "name=oracle-db-ords-apex" --format "{{.ID}}"') DO docker rm -f %%i

REM Iniciar los contenedores con docker-compose
docker-compose up
