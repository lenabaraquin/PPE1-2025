#!/bin/sh
ANNOTATION_PATH="../data/archive-41/ann/"
if [[ !($1 =~ [0-9]{4}) ]]; then
  echo "Renseigner l'année en premier argument, doit un entier de quatre chiffres."
fi
if [[ !($2 =~ [A-Z][a-z]+) ]]; then
  echo "Renseigner l'étiquette en second argument, doit être une chaine de caractère commençant par une majuscule."
fi

YEAR=$1                           #L'année est donnée par le premier argument du script
TAG=$2                            #L'étiquette est donnée par le second argument du script
cd $ANNOTATION_PATH$YEAR          #On se rend dans le répertoire contenant les annotations pour l'année renseignée.
echo $(cat * | grep $TAG | wc -l) #On lit tous les fichiers du répertoire avec cat, on selectionne les lignes contenant le tag renseigné avec grep et on compte ces lignes avec wc -l.
