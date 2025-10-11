#!/bin/sh
ANNOTATION_PATH="../data/archive-41/ann/"

YEAR=$1
MONTH=$2
NB_OUTPUT=$3

ANNOTATION_PATH=$ANNOTATION_PATH$YEAR
cd $ANNOTATION_PATH
echo $(cat $YEAR\_$MONTH* | grep Location | awk '{FS="\t"; if ($2 ~ /Location.*/) {print $3}}')
