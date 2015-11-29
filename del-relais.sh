#!/bin/bash

nom=$1
/bin/sed -i "/$nom/d" /etc/postfix/transport
/bin/sed -i -e "s/, "$nom"//g" /etc/postfix/main.cf
/bin/sed -i "/$nom/d" /etc/postfix/transport.itinet.fr
/usr/sbin/service postfix restart
/usr/sbin/postmap /etc/postfix/transport