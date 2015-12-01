#!/bin/bash

nom=$1

/bin/sed -i -e "s/^$nom[[:space:]]/#$nom	/g" /etc/courier/userdb
/usr/sbin/makeuserdb