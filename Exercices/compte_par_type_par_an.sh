#!/bin/sh
ANNOTATION_PATH="../data/archive-41/ann/"

TAG=$1 #L'étiquette est donnée par le second argument du script
for YEAR in 2016 2017 2018; do
  cd $ANNOTATION_PATH$YEAR                                                #On se rend dans le répertoire contenant les annotations pour l'année courante de la boucle.
  echo Annotations $TAG pour l annee $YEAR : $(cat * | grep $TAG | wc -l) #On lit tous les fichiers du répertoire avec cat, on selectionne les lignes contenant le tag renseigné avec grep et on compte ces lignes avec wc -l.
  cd - >2                                                                 #On retourne au répertoire d'origine (contenant ce script); on redirige la sortie vers stderr pour ne pas l'afficher dans stdout.
done
