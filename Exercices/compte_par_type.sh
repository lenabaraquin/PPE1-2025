#!/bin/sh
ANNOTATION_PATH="../data/archive-41/ann/"

YEAR=2016
ANNOTATION_FILES=$ANNOTATION_PATH$YEAR #On concatène l'année au path du répertoire ann pour obtenir le path du répertoire correspondant à une année donnée.
cd $ANNOTATION_FILES                   #On se rend dans le répertoire contenant les annotations pour l'année courante de la boucle.
COMPT=0
for TAG in Location Date Organization Product Hour Person Event; do
  echo Annotations $TAG pour l annee $YEAR : $(cat * | grep $TAG | wc -l) #On lit tous les fichiers du répertoire (fichiers d'annotations pour l'année courante de la boucle) avec cat, on selectionne les lignes contenant Location avec grep et on compte ces lignes avec wc -l.
  COMPT=$(expr $COMPT + $(cat * | grep $TAG | wc -l))
done
echo $COMPT
echo $(cat * | wc -l)
