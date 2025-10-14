#!/bin/sh
ANNOTATION_PATH="../data/archive-41/ann/"

if [[ !($1 =~ [0-9]{4}) ]]; then
  echo "Renseigner l'année en premier argument, doit être un entier de quatre chiffres."
fi
if [[ !($2 =~ ([0-9]{2}|\*)) ]]; then
  echo "Renseigner le mois en second argument, doit être un entier de deux chiffres."
fi
if [[ !($3 =~ [0-9]+) ]]; then
  echo "Renseigner le nombre de lieux à afficher, doit être un entier."
fi

YEAR=$1
NB_OUTPUT=$3
if [[ $2 =~ [0-9]{2} ]]; then
  MONTH=$2
else
  MONTH=""
fi

cd $ANNOTATION_PATH$YEAR
echo $(cat $YEAR\_$MONTH* | awk '{FS="\t"; if ($2 ~ /Location.*/) {print $3}}' | sort | uniq -c | sort -rn | head -n $3)
