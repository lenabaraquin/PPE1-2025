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

