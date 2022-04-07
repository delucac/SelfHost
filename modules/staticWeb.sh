#!/bin/sh
# File name: staticWeb.sh
# Author: Christopher B. DeLuca
# Date started: April 6th, 2022
# Description:
# Script for installing a static webserver
#
#
echo "staticWeb.sh"

sudo apt update
sudo apt install apache2

#1> is used to silence output
sudo systemctl restart apache2 1> /dev/null
sudo systemctl enable apache2 1> /dev/null

clear
echo "===Push q to exit the status screen===\n"
sudo systemctl status apache2
clear

read -p "Would you like to open your website? (y/n): " prompt
case $prompt in
	[yY]*)
		xdg-open http://127.0.0.1
	;;
	*)
		#none
	;;
esac

exit 0
