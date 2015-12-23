#!/bin/bash

min=$(date +"%M")
min_calc=$(($min-10))
sec=$(date +"%S")


  (
        sleep 1
        echo "mail from:steephen@openworld.itinet.fr"
        sleep 1
        echo "rcpt to:steephen@openworld.itinet.fr"
        sleep 1
        echo "data"
        sleep 1
        echo "subject:Test message"
        sleep 1
        echo "This is a test message."
        sleep 1
        echo "."
        sleep 1
        echo "QUIT"
   ) | telnet smtp.free.fr 25




if [ $sec -ge 56 ] && [ $sec -le 59 ]
then
sec=00
fi

if [ $sec -ge 0 ] && [ $sec -le 07 ]
then
sec2=0$(($sec+02))
echo $sec2
else
sec2=$((sec+2))
fi

#for i in `seq 1 10`
while [ $sec2 != $(date +"%S") ]
do
#	((min_calc++))
#echo $min_calc
date +"%H %M %S"
	mot=$(grep -c -E "^$(LC_ALL=C date +"%h")\ $(date +"%d")\ $(date +"%H")\:$(date +"%M")".*@openworld.*status=bounced /var/log/mail.log)
	echo $mot
	if [ $mot -ge 1 ]
	then
		#echo "on a trouver qq chose"
		cp /etc/postfix/transport /etc/postfix/transport.itinet.fr
#		sed -i "$(grep -n 'postwork' /etc/postfix/transport.itinet.fr | cut -d':' -f1) s/10.8.96.2/10.8.96.1/" /etc/postfix/transport.itinet.fr
		break
	fi
done

#min_cal=$(($min-10))

#for i in `seq 1 10`
#do
#	((min_cal++))
	
#echo $min_cal
#	mot=$(grep -c -E "^$(date +"%h")\ $(date +"%d")\ $(date +"%H")\:$min_calc".*@aos.*status=bounced /var/log/mail.log)
#	if [ $mot -ge 1 ]
#	then
#		sed -i "$(grep -n 'aos' /etc/postfix/transport.itinet.fr | cut -d':' -f1) s/10.8.96.2/10.8.96.3/" /etc/postfix/transport.itinet.fr
#		break
#	elif [ $mot = 0 ]
#	then
#	l="rr"
#	fi
#done
