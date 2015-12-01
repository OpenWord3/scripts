#!/bin/bash

nom=$1

/bin/sed -i -e "s/^#$nom/$nom/g" /etc/courier/userdb
/usr/sbin/makeuserdb