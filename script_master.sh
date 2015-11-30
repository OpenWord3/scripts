#!/bin/bash
#---------------------------------------------------------------------
#OPENWORLD
#SCRIPT MASTER
#AUTEUR MOUGNIN SERGE
#Date 28/11/2015
#---------------------------------------------------------------------

while :
do

        clear;
        echo "Bienvenue dans le script master OPENWORLD";
        echo " ";
        echo "1- Création d'un VHOST";
        echo "2- Désactivation d'un VHOST";
        echo "3- Activation d'un VHOST";
        echo "4- Suppression d'un VHOST";
        echo "5- Création d'une adresse mail";
        echo "6- Suppression d'une adresse mail";
        echo "7- Ajouter un nom de domaine";
        echo "8- Supprimer un nom de domaine";
        echo " ";
        echo "Entrer votre choix";
        read choix;
        if [ $choix == "1" ]
        then
                echo "Vous souhaitez créer un VHOST";
                echo "Entrez le nom du VHOST";
                read nom;
                echo "Entrer le mot de passe";
                read mdp;
                sudo /var/script/add_vhost.sh $nom $mdp;
                echo "Le VHOST $nom a bien été crée";

        elif [ $choix == "2" ]
        then
                echo "Vous souhaitez désactiver un VHOST";
                echo "Entrez le nom du VHOST";
                read nom;
                sudo /var/script/unactivation_vhost.sh $nom;
                echo "Le VHOST $nom a bien été désactivé";

        elif [ $choix == "3" ]
        then
                echo "Vous souhaitez activer un VHOST";
                echo "Entrez le nom du VHOST";
                read nom;
                echo "Entrer le mot de passe";
                read mdp;
                sudo /var/script/activation_vhost.sh $nom;
                echo "Le VHOST $nom a bien été crée";

        elif [ $choix == "4" ]
        then
                echo "Vous souhaitez supprimer un VHOST";
                echo "Entrez le nom du VHOST";
                read nom;
                echo "Voulez vous réellement supprimer $nom ? oui/non";
                read reponse;
                if [ $reponse == "oui" ]
                then
                        sudo /var/script/remove_vhost.sh $nom;
                        echo "Le VHOST $nom a bien été supprimé";
                else
                        echo "$nom peut me remercier";
                fi

        elif [ $choix == "5" ]
        then
                echo "Vous souhaitez créer une adresse mail OpenWorld";
                echo "Entrez le nom du client";
                read nom;
                echo "Entrez le mot de passe";
                read mdp;
                sudo /var/script/add_mail_account.sh $nom $mdp;
                echo "Bienvenu parmi nous $nom@openworld.itinet.fr";

        elif [ $choix == "6" ]
        then
                echo "Vous souhaitez supprimer une adresse mail";
                echo "Entrez le nom du client";
                read nom;
                echo "Voulez vous réellement supprimer $nom@openworld.itinet.fr ? oui/non";
                read reponse;
                if [ $reponse == "oui" ]
                then
                        sudo /var/script/del_mail_account.sh $nom;
                        echo "L'adresse $nom@openworld.itinet.fr a bien été supprimé";
                else
                        echo "$nom@openworld.itinet.fr peut me remercier";
                fi

        elif [ $choix == "7" ]
        then
                echo "Vous souhaitez ajouter un nom de domaine";
                echo "Entrez le nom du domaine";
                read nom;
                echo "Entrez l'adresse IP";
                read ip;
                sudo /var/script/add-relais.sh $nom $ip;
                echo "Le nom de domaine $nom a bien été enregistré";

        elif [ $choix == "8" ]
        then
                echo "Vous souhaiter supprimer un nom de domaine";
                echo "Entrez le nom de domaine a supprimé";
                read nom;
                echo "Voulez vous réellement supprimer $nom ? oui/non";
                read reponse;
                if [ $reponse == "oui" ]
                then
                        sudo /var/script/del-relais.sh $nom;
                        echo "Le domaine $nom a bien été supprimé";
                else
                        echo "$nom peut me remercier";
                fi 

        else
                echo "Cette option n'existe pas :p";
        fi

        echo "Voulez-vous continuer ? oui/non"
        read reponse

        if [ $reponse = "non" -o $reponse = "NON" ];then
                break
        fi
done
clear;                                               