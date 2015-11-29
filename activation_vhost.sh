#---------------------------------------------------------------------
#OPENWORLD
#ACTIVATION D'UN VHOST
#AUTEUR MOUGNIN SERGE
#Date 09/11/2015
#---------------------------------------------------------------------
#!/bin/sh

if test -z "$1"
then
        echo "Erreur"
        echo "Entrer en argument le nom du serveur"
else
        #Créer le lien symbolique dans sites-enabled
        /bin/ln -s /etc/apache2/sites-available/$1.conf /etc/apache2/sites-enabled/

        #Redemarrage de Apache
        /usr/sbin/service apache2 restart

        #Redemarrage de SSH
        /usr/sbin/service ssh restart
fi