# Journal de bord du projet encadré

## Première mise à jour du dépot
Un premier commit a été réalisé dans l'interface web de github pour créer le fichier `journal.md`.

## Mercredi 8 octobre

### Préparation
Importation des données dans un repertoire `data/`
Ajout du repertoire `data/` dans le `.gitignore`

### Exercice 1
Difficultés : 
J'ai du modifier le shebang `#!/usr/bin/bash` en `#!/bin/zsh` pour récupérer le shell de macOS.

Le script `comptes.sh` fonctionne et est commenté.

Dans le script `./Exercices/compte_par_type.sh`, pour m'assurer de l'exhaustivité de la liste des étiquettes, j'ai ajouté un compteur dans la boucle qui itère sur les étiquettes pour compter le nombre d'occurences de chaque étiquettes : `COMPT=$(expr $COMPT + $(cat * | grep $TAG | wc -l))`.
J'ai ensuite comparé la valeur de ce compteur en sortie de boucle avec le nombre total d'occurences des fichiers annotés (correspondant au nombre de lignes):
```
echo $COMPT
echo $(cat * | wc -l)
```

### Exercice 2

**script compte_par_lieux.sh**
Après avoir tanté de faire une fonction pour compter le nombre d'occurences de chaque lieux, j'ai demandé de l'aide à une amie et j'ai pu découvrir l'option `-c` de `uniq` qui permet de compter les occurences des items supprimés.

Je n'arrive pas à faire accepter `*` en second parametre, lorsque le script tante de récupérer l'argument, il semble interpréter `$*` et non `*`. Je corrigerai le script plus tard.

### Exercice 4

**explication script cours**
Le premier bloc de code est un bloc conditionnel et vérifie qu'aucun ou plusieur arguments aient été fournis, auquel cas le script affiche une erreur et s'arrête, sinon le reste du script s'execute.

La variable FICHIER_URLS prends la valeur du premier argument passé au script.
Les variables OK et NOK sont des compteurs qui sont initialisés à zéro.

Le second bloc de code est une boucle while qui itère sur les lignes du fichier dont le chemin est contenu dans la variable FICHIER_URLS.
Pour chaque itération: 
 - Si le contenu de la ligne commence par `http://` ou `https://`, le script imprime un message dans la sortie standard pour indiquer que la ligne courante ressemble à une URL valide et incrémente le compteur OK.
 - Sinon, le script imprime un message dans la sortie standard pour indiquer que la ligne courante ne ressemble pas à une URL valide et incrémente le compteur NOK.

Enfin, le script imprime le nombre de lignes correspondant à des URLs valides et celui des URLs non valides dans la sortie standard.

## Mini Projet

### Exercice 1

Utiliser une boucle while avec `read` permet de lire les lignes une à une, ce que ne permet pas `cat` qui lit tout le fichier d'un coup.

### Exercice 2 

Parmi les urls présentes dans le fichier `./miniprojet/urls/fr.txt`, l'url `xxx` renvoie vers un site dont le certificat n'est pas à jour, `curl` ne peut donc pas récupérer le contenu de cette page;
l'url `xxx` n'est pas précédée par `https://`, curl ne permettant pas d'omettre ce préfixe comme les navigateurs web usuels, il ne parvient pas à récupérer le contenu de cette page.
Le préfixe a été ajouté dans le fichier contenant la liste des urls.
