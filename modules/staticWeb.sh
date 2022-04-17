#!/bin/sh
# File name: staticWeb.sh
# Author: Christopher B. DeLuca
# Date started: April 6th, 2022
# Description:
# Script for installing a static webserver
#
#


echo "Static website setup"

sudo apt update
sudo apt install apache2

#1> is used to silence output
sudo systemctl restart apache2 1> /dev/null
sudo systemctl enable apache2 1> /dev/null

clear

echo "===Push q to exit the status screen===\n"
sudo systemctl status apache2
clear


#Create link to website
if [ ! -e "./website" ]
then
	ln -s /var/www/html/ website
	echo "Creating link to website in current directory"
fi

#copy welcome page
if [ ! -e "./modules/webpages/welcome.html" ]
then
	echo "Welcome page not present, downloading"
	cd modules/webpages
	wget https://raw.githubusercontent.com/delucac/SelfHost/main/modules/webpages/welcome.html
	cd ../../
fi
sudo mkdir /var/www/html/selfHost
sudo cp modules/webpages/welcome.html /var/www/html/selfHost/index.html

echo "website available on local network via $(ip route get 8.8.8.8 | grep -oP 'src \K[^ ]+')"
read -p "Would you like to open your website? (y/n): " prompt
case $prompt in
	[yY]*)
		xdg-open http://127.0.0.1 1/selfHost> /dev/null 2> /dev/null
	;;
	*)
		#none
	;;
esac

exit 0
