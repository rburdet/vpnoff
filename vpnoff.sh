#!/bin/bash
NOTIFIED=false;

while [ 1 ] ;
	do
		JOURNAL=$(journalctl -n -u NetworkManager | grep "$1.*disappeared")
		echo $JOURNAL;

		if [ -z "$JOURNAL" ]
		then
			NOTIFIED=false
		else
			if [ "$NOTIFIED" = false ] ; then
				`notify-send -i /usr/share/icons/gnome/32x32/actions/process-stop.png "ERROR EN LA VPN" "SE HA DESCONECTADO"`;
				NOTIFIED=true;
			fi
		fi
		sleep 1;
	done;

 



