#---------------------------------------------------------------------
#OPENWORLD
#SCRIPT MASTER
#AUTEUR MOUGNIN SERGE
#Date 28/11/2015
#---------------------------------------------------------------------
#!/bin/sh

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
                /var/script/add_vhost.sh $nom $mdp;
                echo "Le VHOST $nom a bien été crée";

        elif [ $choix == "2" ]
        then
                echo "Vous souhaitez désactiver un VHOST";
                echo "Entrez le nom du VHOST";
                read nom;
                /var/script/unactivation_vhost.sh $nom;
                echo "Le VHOST $nom a bien été désactivé";

        elif [ $choix == "3" ]
        then
                echo "Vous souhaitez activer un VHOST";
                echo "Entrez le nom du VHOST";
                read nom;
                echo "Entrer le mot de passe";
                read mdp;
                /var/script/add_vhost.sh $nom $mdp;
                echo "Le VHOST $nom a bien été crée";

        elif [ $choix == "2" ]
        then
                echo "Vous souhaitez désactiver un VHOST";
                echo "Entrez le nom du VHOST";
                read nom;
                /var/script/unactivation_vhost.sh $nom;
                echo "Le VHOST $nom a bien été désactivé";

        elif [ $choix == "3" ]
        then
                echo "Vous souhaitez activer un VHOST";
                echo "Entrez le nom du VHOST";
                read nom;
                /var/script/activation_vhost.sh $nom;
                echo "Le VHOST $nom a bien été activé";

        elif [ $choix == "4" ]
        then
                echo "Vous souhaitez supprimer un VHOST";
                echo "Entrez le nom du VHOST";
                read nom;
                echo "Voulez vous réellement supprimer $nom ? oui/non";
                read reponse;
                if [ $reponse == "oui" ]
                then
                        /var/script/remove_vhost.sh $nom;
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
                /var/script/add_mail_account.sh $nom $mdp;
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
                        /var/script/del_mail_account.sh $nom;
                        echo "L'adresse $nom@openworld.itinet.fr a bien été supprimé";
                else
                        echo "$nom@openworld.itinet.fr peut me remercier";
                fi

        else
                echo "Cette option n'existe pas :p";
        fi
        clear;

        echo "Voulez-vous continuer ? non ou NON pour quitter"
        read reponse

        if [ $reponse = "non" -o $reponse = "NON" ];then
                break
        fi
done
                                               