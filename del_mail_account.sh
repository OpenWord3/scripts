#!/bin/sh
#Script permettant de supprimer un compte mail

user=$1

if [ -z $user ];then
        echo "ERREUR veuillez entrer un nom"
        #exit
else
        verif=`/bin/grep $user /etc/postfix/vmailbox`
        if [ -z "$verif" ];then
                echo "Ce compte n'existe pas donc ne peut etre supprime"
                #exit
        else
                #suppression de la ligne dans vmailbox
                /bin/sed -i "/$user@/d" /etc/postfix/vmailbox
                /usr/sbin/postmap /etc/postfix/vmailbox
                #/etc/init.d/postfix restart

                #suppression du repertoire du compte
                `/bin/rm -r /var/mail/$user`

                #suppression dans le fichier userdb
                /bin/sed -i "/$user/d" /etc/courier/userdb
                /usr/sbin/makeuserdb
        fi
fi