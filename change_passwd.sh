#! /bin/bash

#script qui change le mot de passe de l'utilisateur

nom=$1
pass=$2

/bin/sed -i "/$nom[[:space:]]/d" /etc/courier/userdb
/usr/sbin/makeuserdb

/usr/sbin/userdb $nom set uid=1010 gid=1010 home=/var/openmail/$nom mail=/var/openmail/$nom
/bin/echo $pass | /usr/sbin/userdbpw -md5 | /usr/sbin/userdb "$nom" set systempw
/usr/sbin/makeuserdb