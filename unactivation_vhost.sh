#---------------------------------------------------------------------
#OPENWORLD
#DESACTIVATION D'UN VHOST
#AUTEUR MOUGNIN SERGE
#Date 09/11/2015
#---------------------------------------------------------------------
#!/bin/sh

if test -z "$1"
then
        echo "Erreur"
        echo "Entrer en argument le nom du VHOST"
else
        #Suppression du lien symbolique dans sites-enabled
        /bin/rm /etc/apache2/sites-enabled/$1.conf

        #Redemarrage de Apache
        /usr/sbin/service apache2 restart

        #Redemarrage de SSH
        /usr/sbin/service ssh restart
fi