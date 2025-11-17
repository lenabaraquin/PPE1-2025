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
    <title> Tableau des URLs </title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.4/css/bulma.min.css">
  </head>
  <body>
    <section class="section has-background-grey">
      <div class="container has-background-white">
        <div class="hero has-text-centered">
          <div class="hero-body">
            <h1 class="title">
              Tableau des URLs
            </h1>
          </div>
        </div>
        <div class="columns is-centered">
          <aside class="menu">
            <p class="menu-label">Menu</p>
            <ul class="menu-list">
              <li><a href="../../index.html">Accueil</a></li>
              <li class="is-active"><a class="is-active" href="./tableau-fr.html">Tableaux</a></li>
            </ul>
          </aside>
          <div class="column is-half">
            <div class="block content">
              <table class = "table is-bordered is-hoverable is-striped">
                <tr><th>id</th><th>url</th><th>code HTTP</th><th>encodage</th><th>nombre de mots</th></tr>'''

path=$1
n=1
while read -r line; do
  curl -sL -D tmp.headers -o tmp.html ${line}
  http_code=$(grep "HTTP/2" tmp.headers | cut -f 2 -d " ")
  encodage=$(grep "charset=" tmp.headers | cut -f 2 -d "=" | tr -d '\r') #Le tr permet de régler un problème de formatage de la sortie (le nombre de mot s'affichait dans la colonne des urls en écrasant le début de la chaine)
  nb_mots=$(lynx -dump -nolist tmp.html | wc -w)
  echo "                <tr>"
  echo -e "                  <td>${n}</td><td>${line}</td><td>${http_code}</td><td>${encodage}</td><td>${nb_mots}</td>"
  echo "                </tr>"
  n=$(expr $n + 1)
  rm tmp.headers tmp.html
done <$path

echo '''              </table>
            </div>
          </div>
        </div>
    </section>
  </body>
</html>
'''
