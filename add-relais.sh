#!/bin/bash

nom=$1
ip=$2
verif=`grep $nom /etc/postfix/transport`

if [ -z "$verif" ];then
        echo $nom $ip
        /bin/echo ""$nom"       smtp:"$ip"" >> /etc/postfix/transport
        /bin/sed -i -e 's/^\(relay.*domains\).*$/&, '$nom'/g' /etc/postfix/main.cf
        /usr/sbin/service postfix restart
        /usr/sbin/postmap /etc/postfix/transport

        /bin/echo ""$nom"       smtp:10.8.96.2" >> /etc/postfix/transport.itinet.fr
        /usr/bin/ssh -i /root/.ssh/id_rsa root@10.8.97.1

else
        echo "Ce domaine existe deja"
fi