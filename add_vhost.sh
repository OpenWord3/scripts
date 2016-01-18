#!/bin/bash
#---------------------------------------------------------------------
#OPENWORLD
#AJOUT D'UN VHOST
#AUTEUR MOUGNIN SERGE
#Date 09/11/2015
#---------------------------------------------------------------------

if test -z "$1";
then
        /bin/echo "Erreur ! Entrer en argument le nom du VHOST"
else
        #Creation des dossiers dans /var/blog/
        /bin/mkdir /var/blog/$1.openworld.itinet.fr/

        #Creation du groupe et configuration du fichier sftp_config
        if /bin/grep -q "groupe_utilisateur" "/etc/group";
        then
                #Creation de l'utilisateur
                password=$(/usr/bin/mkpasswd $2)
                /usr/sbin/useradd $1 -p $password --shell /usr/bin/mysecureshell --gid 1009 --home /var/blog/$1 -m

                #Creation de l'index du repertoire
                /usr/bin/unzip /var/script/wordpress.zip -d /var/script/
                /bin/cp -R /var/script/wordpress/* /var/blog/$1.openworld.itinet.fr/
                /bin/rm -R /var/script/wordpress/

                #Changer le propriétaires des dossiers
                /bin/chown -R www-data:groupe_utilisateur /var/blog/$1.openworld.itinet.fr/
                /bin/chmod -R 770 /var/blog/$1.openworld.itinet.fr/

                #Creation de BDD et de l'utilisateur
                /usr/bin/mysql --user=root --password=africainetfier -e "create database $1; create user '$1'@'localhost'; set password for $1@localhost= password('$2');
                grant all privileges on $1.* to '$1'@'localhost' identified by '$2';"

                #Ajout d'un vhost dans le fichier de configuration
                /bin/echo "<VirtualHost *:80>" >> /etc/apache2/sites-available/$1.conf
                /bin/echo "ServerName $1.openworld.itinet.fr" >> /etc/apache2/sites-available/$1.conf
                /bin/echo "DocumentRoot /var/blog/$1.openworld.itinet.fr/" >> /etc/apache2/sites-available/$1.conf
                /bin/echo "</VirtualHost>" >> /etc/apache2/sites-available/$1.conf

                #Création du lien symbolique dans sites-enabled
                /bin/ln -s /etc/apache2/sites-available/$1.conf /etc/apache2/sites-enabled/

                #Fixation des quotas
                /usr/sbin/setquota -u $1 245760 307200 0 0 /dev/sda7
                /usr/sbin/setquota -u $1 819200 1024000 0 0 /dev/sda6

                #Création fqdnç
                /etc/tinydns/root/add-fqdn.sh $1

                #Redemarrage de Apache
                /usr/sbin/service apache2 reload

                #Redemarrage de SSH
                /usr/sbin/service ssh restart

        else
                #/usr/sbin/addgroup groupe_utilisateur --gid 1009
                echo "Créez un groupe avec le GID 1009 et on en reparle";
        fi
fi