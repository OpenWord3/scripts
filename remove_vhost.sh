#!/bin/bash
#---------------------------------------------------------------------
#OPENWORLD
#AJOUT D'UN VHOST
#AUTEUR MOUGNIN SERGE
#Date 09/11/2015
#---------------------------------------------------------------------

if test -z "$1"
then
        /bin/echo "Erreur ! Entrer en argument le nom du VHOST"
else
        #Suppression de l'utilisateur
        /usr/sbin/userdel $1

        #Suppression de la base de données
        /usr/bin/mysql --user=root --password=openworld -e "drop database $1; drop user '$1'@'localhost';"

        #Suppression des dossiers dans /var/blog
        /bin/rm -R /var/blog/$1/

        #Suppression des fichiers dans /etc/apache2/sites-availables
        /bin/rm /etc/apache2/sites-available/$1.conf

        #Suppression des liens
        /bin/rm /etc/apache2/sites-enabled/$1.conf

        #Suppression de fqdn
        /etc/tinydns/root/del-fqdn.sh $1

        #Redemarrage Apache
        /usr/sbin/service apache2 restart
fi