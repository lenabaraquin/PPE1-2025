#!/bin/bash

if [[ !($# == 1) ]]; then
  echo "Passer le chemin en paramètre"
  exit
fi

path=$1
n=0
while read -r line; do
  curl -sL -D tmp.headers -o tmp.html ${line}
  http_code=$(grep "HTTP/2" tmp.headers | cut -f 2 -d " ")
  encodage=$(grep "charset=" tmp.headers | cut -f 2 -d "=" | tr -d '\r') #Le tr permet de régler un problème de formatage de la sortie (le nombre de mot s'affichait dans la colonne des urls en écrasant le début de la chaine)
  nb_mots=$(lynx -dump -nolist tmp.html | wc -w)
  echo -e "${n}\t${line}\t${http_code}\t${encodage}\t${nb_mots}"
  n=$(expr $n + 1)
done <$path

rm tmp.headers tmp.html
