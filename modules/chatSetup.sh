#!/bin/sh
# File name: chat.sh
# Author: Christopher B. DeLuca
# Date started: April 14th, 2022
# Description:
# File to configure webserver for chat
#
#

echo "chatSetup.sh"

#make directory
echo "Adding directory to website"
sudo mkdir /var/www/html/key 1> /dev/null 2> /dev/null

#Check for redirect file locally before sourcing
if [ -e "./modules/webpages/redirect.html" ]
then
	sudo cp modules/webpages/redirect.html /var/www/html/key/index.html
fi
if [ ! -e "./modules/webpages/redirect.html" ]
then
	echo "webpage file not present, downloading"
	cd modules/webpages
	wget https://raw.githubusercontent.com/delucac/SelfHost/main/modules/webpages/redirect.html
	cd ../../
	sudo cp modules/webpages/redirect.html /var/www/html/key/index.html
fi

cd data

#use openssl to generate keys
echo "Generating private key"
read -p "Please enter your name: " nameIn
openssl genrsa -aes128 -out $nameIn.pem 1024
echo "Generating public key"
openssl rsa -in $nameIn.pem -pubout > $nameIn.pub.pem

#copy contents to website directory
sudo cp $nameIn.pub.pem /var/www/html/key

#make keys folder and pub keys folder
mkdir pub_keys
mkdir keys

#move keys to keys folder
mv $nameIn* ./keys

cd ../

exit 0
