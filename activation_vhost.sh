#!/bin/bash
#---------------------------------------------------------------------
#OPENWORLD
#ACTIVATION D'UN VHOST
#AUTEUR MOUGNIN SERGE
#Date 09/11/2015
#---------------------------------------------------------------------

if test -z "$1"
then
        /bin/echo "Erreur ! Entrer en argument le nom du VHOST"
else
        #Créer le lien symbolique dans sites-enabled
        /bin/ln -s /etc/apache2/sites-available/$1.conf /etc/apache2/sites-enabled/

        #Redemarrage de Apache
        /usr/sbin/service apache2 reload

        #Redemarrage de SSH
        /usr/sbin/service ssh restart
fi