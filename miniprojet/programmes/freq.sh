#!/bin/bash

#if [[ !($# == 1) ]]; then
if [[ -z "$1" ]]; then
  echo "Passer le chemin en premier parametre, et optionnellement le nombre de mots a afficher en second argument"
  exit
fi
if [[ -z "$2" ]]; then
  n_plus_freq=25
else
  n_plus_freq=$2
fi

pretraitement_path=${0//freq.sh/pretraitement.sh}

$pretraitement_path $1 | sort | uniq -c | sort -rn | head -n ${n_plus_freq}
