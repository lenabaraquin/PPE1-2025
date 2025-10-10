#!/bin/sh
ANNOTATION_PATH="../data/archive-41/ann/"

YEAR=$1                                #L'année est donnée par le premier argument du script
ANNOTATION_FILES=$ANNOTATION_PATH$YEAR #On concatène l'année au path du répertoire ANNOTATION_PATH pour obtenir le path du répertoire correspondant à l'année renseignée.
TAG=$2                                 #L'étiquette est donnée par le second argument du script
cd $ANNOTATION_FILES                   #On se rend dans le répertoire contenant les annotations pour l'année renseignée.
echo $(cat * | grep $TAG | wc -l)      #On lit tous les fichiers du répertoire avec cat, on selectionne les lignes contenant le tag renseigné avec grep et on compte ces lignes avec wc -l.
