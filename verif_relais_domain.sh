#!/bin/bash

nb=$(echo $1|grep -c -w '[a-z]\+[.][a-z]\+')
if [ $nb == 1 ]
then
	resultat=$(grep -c -i "$1" /etc/postfix/main.cf)
	
	if [ $resultat == 1 ]
	then
		echo "Ce domaine existe dans le fichier main.cf"
	else
		echo "Ce domaine n'existe pas dans le fichier main.cf"
	fi

else
	echo "Veuilez entrer un nom de domaine valide"
fi