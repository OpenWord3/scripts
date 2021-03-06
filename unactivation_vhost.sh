#!/bin/bash
#---------------------------------------------------------------------
#OPENWORLD
#DESACTIVATION D'UN VHOST
#AUTEUR MOUGNIN SERGE
#Date 09/11/2015
#---------------------------------------------------------------------

if test -z "$1"
then
        /bin/echo "Erreur ! Entrer en argument le nom du VHOST"
else
        #Suppression du lien symbolique dans sites-enabled
        /bin/rm /etc/apache2/sites-enabled/$1.conf

        #Redemarrage de Apache
        /usr/sbin/service apache2 reload

        #Redemarrage de SSH
        /usr/sbin/service ssh restart
fi