#!/bin/bash

imagenTag="solucion/postgresql"
containerName="solucion_postgresql"
portLocal="5432"
portDocker="5432"

echo "Ejecutando Imagen Docker de $imagenTag"

echo "-> Bajando containers"
for cnt in $(docker container ls | grep "${imagenTag} " | awk '{ print $1 }'); do
  echo "->   Container:${cnt}"
  echo "->     docker stop ${cnt}"
  docker stop ${cnt}
done

echo "-> Ejecutando Imagen"
docker run --name solucion -it --restart unless-stopped -d -p ${portLocal}:${portDocker} ${imagenTag}

echo '==FIN del RUN=='
