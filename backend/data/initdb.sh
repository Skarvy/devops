#!/bin/bash

NAME_DB="wanderlust"
NAME_COLLECTION="posts"
NAME_FILE="sample_posts.json"
DIR_DB_DOCKER="docker-entrypoint-initdb.d"

PATH_DB="./${DIR_DB_DOCKER}/${NAME_FILE}"

echo "Cargando los datos de ${NAME_DB}"
echo "Colección: ${NAME_COLLECTION}"

mongoimport \
    --db $NAME_DB \
    --collection $NAME_COLLECTION \
    --file $PATH_DB --jsonArray || {
    echo "Error al importar datos. Revisar el archivo y los parámetros."
    exit 1
}

echo "Carga exitosa de los datos"