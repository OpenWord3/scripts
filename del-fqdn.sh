# SCRIPT SUPPRIMER FQDN

/bin/sed -i "/$1/d" /etc/tinydns/root/data
/usr/bin/ssh -i /root/.ssh/id_rsa root@dedibox.itinet.fr