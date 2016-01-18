#! /bin/bash

#script qui change le mot de passe de l'utilisateur

nom=$1
pass=$2

/bin/sed -i "/$nom[[:space:]]/d" /etc/courier/userdb
/usr/sbin/makeuserdb

/usr/sbin/userdb $nom set home=/var/mail/$nom mail=/var/mail/$nom uid=1010 gid=1010
/bin/echo $pass | /usr/sbin/userdbpw -md5 | /usr/sbin/userdb "$nom" set systempw

/usr/sbin/makeuserdb

/usr/bin/passwd $nom <<EOF
$pass
$pass
EOF