# SCRIPT AJOUTER FQDN
/bin/echo "=$1.openworld.itinet.fr:88.177.168.133:86400" >> /etc/tinydns/root/data
/usr/bin/ssh -i /root/.ssh/id_rsa root@dedibox.itinet.fr