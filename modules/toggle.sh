#!/bin/sh
# File name: toggle.sh
# Author: Christopher B. DeLuca
# Date started: April 19th, 2022
# Description:
# file to toggle website on and off
#
#

echo "toggle.sh"
run=5
while [ $run -gt 1 ]
do

clear

#toggle apache service
echo "===Apache Service==="
echo "1. Turn off websever"
echo "2. Turn on webserver"
echo "3. webserver status"
echo "E. exit"
echo "\n"

read -p "Please make a selection: " choice
echo "\n"


case $choice in
	1) #Turn off apache
		echo "turning off webserver"
		sudo systemctl disable apache2.service
		sudo systemctl stop apache2.service
		echo "=== Push q to exit the status screen ===\n"
		sudo systemctl status apache2
		clear
	;;
	2) #Turn on apache
		echo "turning on webserver"
		sudo systemctl enable apache2.service
		sudo systemctl start apache2.service
		echo "=== Push q to exit the status screen ===\n"
		sudo systemctl status apache2
		clear
        ;;
	3) #status
		echo "=== Push q to exit the status screen ===\n"
		sudo systemctl status apache2
		clear
	;;
	[eE])
		run=0
	;;
	*)
		clear
		echo "Error: invalid value"
	;;
esac
done

exit 0
