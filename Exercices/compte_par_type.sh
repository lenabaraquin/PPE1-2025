#!/bin/sh
ANNOTATION_PATH="../data/archive-41/ann/"

YEAR=2016
ANNOTATION_FILES=$ANNOTATION_PATH$YEAR                                    #On concatène l'année au path du répertoire ann pour obtenir le path du répertoire correspondant à une année donnée.
cd $ANNOTATION_FILES                                                      #On se rend dans le répertoire contenant les annotations pour l'année définie (2016).
for TAG in Location Date Organization Product Hour Person Event; do       #Liste des étiquettes possible
  echo Annotations $TAG pour l annee $YEAR : $(cat * | grep $TAG | wc -l) #On lit tous les fichiers du répertoire avec cat, on selectionne les lignes contenant le tag courant avec grep et on compte ces lignes avec wc -l.
done
