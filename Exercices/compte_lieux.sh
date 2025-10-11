#!/bin/sh
function count_items() {
  local LAST=""
  local COUNTER=0
  LIST = $1
  while read ITEM; do
    if ($ITEM==$LAST); then
      $COUNTER++
    else
      echo -e "$COUNTER\t $LAST"
    fi
  done < $LIST
  return
}

ANNOTATION_PATH="../data/archive-41/ann/"

YEAR=$1
MONTH=$2
NB_OUTPUT=$3

cd $ANNOTATION_PATH$YEAR
echo $(cat $YEAR\_$MONTH* | awk '{FS="\t"; if ($2 ~ /Location.*/) {print $3}}' | sort | count_items)
