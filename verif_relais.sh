#!/bin/bash

min=$(date +"%M")
min_calc=$(($min-10))


for i in `seq 1 10`
do
	((min_calc++))
	
	mot=$(grep -c -E "^$(date +"%h")\ $(date +"%d")\ $(date +"%H")\:$min_calc".*@postwork.*status=bounced /var/log/mail.log)
	if [ $mot -ge 1 ]
	then
		sed -i "$(grep -n 'postwork' /etc/postfix/transport.itinet.fr | cut -d':' -f1) s/10.8.96.2/10.8.96.1/" /etc/postwork/itinet.fr
		exit
	elif [ $mot = 0 ]
	then
	fi
done

min_calc=$(($min-10))

for i in `seq 1 10`
do
	((min_calc++))
	
	mot=$(grep -c -E "^$(date +"%h")\ $(date +"%d")\ $(date +"%H")\:$min_calc".*@aos.*status=bounced /var/log/mail.log)
	if [ $mot -ge 1 ]
	then
		sed -i "$(grep -n 'aos' /etc/postfix/transport.itinet.fr | cut -d':' -f1) s/10.8.96.2/10.8.96.3/" /etc/postwork/itinet.fr
		exit
	elif [ $mot = 0 ]
	then
	fi
done
