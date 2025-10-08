#!/bin/sh
ANNOTATION_PATH="../data/archive-41/ann/"

echo $(wc -l ../journal.md)
for ANNEE in 2016 2017 2018
do
  ANNOTATION_FILES=$ANNOTATION_PATH$ANNEE
  cd $ANNOTATION_FILES
  echo Annotations Location pour l annee $ANNEE : $(cat * | grep Location | wc -l)
  cd - >2
done
