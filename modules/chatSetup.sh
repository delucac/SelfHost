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

#Check for index file locally before sourcing
if [ -e "./modules/webpages/redirect.html" ]
then
	sudo cp modules/webpages/redirect.html /var/www/html/key/index.html
fi
if [ ! -e "./modules/webpages/redirect.html" ]
then
	echo "index file not present, downloading"
	cd modules
	wget https://raw.githubusercontent.com/delucac/SelfHost/main/modules/index.html
	cd ..
	sudo cp modules/webpages/redirect.html /var/www/html/key/index.html
fi

#make file for parking
touch data/keyName
echo "selfHost" >> data/keyName

cd data

#use ssh-kegen to generate keys
# <test sends the contents of test to the command
# 1> sends the output of the command to nothing
echo "Generating key pair"
ssh-keygen < keyName 1> /dev/null


#copy contents to website directory
sudo cp selfHost.pub /var/www/html/key 1> /dev/null

#clean up
rm keyName

cd ../

exit 0
