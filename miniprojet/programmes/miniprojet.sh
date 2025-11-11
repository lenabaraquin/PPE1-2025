#!/bin/bash

if [[ !($# == 1) ]]; then
  echo "Passer le chemin en paramètre"
  exit
fi

echo '''
<!DOCTYPE html>
<html lang="fr">
  <head>
    <meta charset="UTF-8">
  </head>
  <body>
    <table>
      <tr><th>id</th><th>url</th><th>code HTTP</th><th>encodage</th><th>nombre de mots</th></tr>
'''
path=$1
n=0
while read -r line; do
  curl -sL -D tmp.headers -o tmp.html ${line}
  http_code=$(grep "HTTP/2" tmp.headers | cut -f 2 -d " ")
  encodage=$(grep "charset=" tmp.headers | cut -f 2 -d "=" | tr -d '\r') #Le tr permet de régler un problème de formatage de la sortie (le nombre de mot s'affichait dans la colonne des urls en écrasant le début de la chaine)
  nb_mots=$(lynx -dump -nolist tmp.html | wc -w)
  echo "        <tr>"
  echo -e "          <td>${n}</td><td>${line}</td><td>${http_code}</td><td>${encodage}</td><td>${nb_mots}</td>"
  echo "        </tr>"
  n=$(expr $n + 1)
done <$path

echo '''
    </table>
  </body>
</html>
'''
rm tmp.headers tmp.html
