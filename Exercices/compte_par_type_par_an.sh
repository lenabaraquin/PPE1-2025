#!/bin/sh
ANNOTATION_PATH="../data/archive-41/ann/"

for YEAR in 2016 2017 2018; do
  ANNOTATION_FILES=$ANNOTATION_PATH$YEAR                                    #On concatène l'année au path du répertoire ann pour obtenir le path du répertoire correspondant à une année donnée.
  cd $ANNOTATION_FILES                                                      #On se rend dans le répertoire contenant les annotations pour l'année courante de la boucle.
  for TAG in Location Date Organization Product Hour Person Event; do       #Liste des étiquettes possible
    echo Annotations $TAG pour l annee $YEAR : $(cat * | grep $TAG | wc -l) #On lit tous les fichiers du répertoire avec cat, on selectionne les lignes contenant le tag courant avec grep et on compte ces lignes avec wc -l.
  done
  cd - >2 #On retourne au répertoire d'origine (contenant ce script); on redirige la sortie vers stderr pour ne pas l'afficher dans stdout.
done
