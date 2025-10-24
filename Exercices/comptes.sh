#!/bin/sh
ANNOTATION_PATH="../data/archive-41/ann/"

for ANNEE in 2016 2017 2018; do
  ANNOTATION_FILES=$ANNOTATION_PATH$ANNEE #On concatène l'année au path du répertoire ann pour obtenir le path du répertoire correspondant à une année donnée.
  cd $ANNOTATION_FILES                    #On se rend dans le répertoire contenant les annotations pour l'année courante de la boucle.
  echo $(cat * | grep Location | wc -l)   #On lit tous les fichiers du répertoire (fichiers d'annotations pour l'année courante de la boucle) avec cat, on selectionne les lignes contenant Location avec grep et on compte ces lignes avec wc -l.
  cd - >2                                 #On retourne au répertoire d'origine (contenant ce script); on redirige la sortie vers stderr pour ne pas l'afficher dans stdout.
done
