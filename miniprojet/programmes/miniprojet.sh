#!/bin/bash

if [[ !($# == 1) ]]; then
  echo "Passer le chemin en paramètre"
  exit
fi

path=$1
n=0
while read -r line; do
  http_code=$(curl -is ${line} | grep "HTTP/2" | cut -f 2 -d " ")
  encodage=$(curl -is ${line} | grep "content-type:" | cut -f 2 -d "=")
  echo -e "${n}\t${line}\t${http_code}\t${encodage}"
  n=$(expr $n + 1)
  sleep 1 # Pour éviter l'erreur 429
done <$path
