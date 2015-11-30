#!/bin/bash

nom=$1
/bin/sed -i "/$nom/d" /etc/postfix/transport
/bin/sed -i -e "s/, "$nom"//g" /etc/postfix/main.cf
/bin/sed -i "/$nom/d" /etc/postfix/transport.itinet.fr
/usr/bin/ssh -i /root/.ssh/id_rsa root@10.8.97.1
/usr/sbin/service postfix restart
/usr/sbin/postmap /etc/postfix/transport