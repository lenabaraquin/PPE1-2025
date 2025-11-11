#!/bin/bash

if [[ !($# == 1) ]]; then
  echo "Passer le chemin en paramètre"
  exit
fi

egrep -o "\w+" $1 | tr '[:upper:]' '[:lower:]'
