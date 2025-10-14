#!/bin/sh

ANNOTATION_PATH="../data/archive-41/ann/"

YEAR=$1
MONTH=$2
NB_OUTPUT=$3

cd $ANNOTATION_PATH$YEAR
echo $(cat $YEAR\_$MONTH* | awk '{FS="\t"; if ($2 ~ /Location.*/) {print $3}}' | sort | uniq -c | sort -rn | head -n $3)
