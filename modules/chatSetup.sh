#!/bin/sh
# File name: chat.sh
# Author: Christopher B. DeLuca
# Date started: April 14th, 2022
# Description:
# File to configure webserver for chat
#
#

echo "chat.sh"

#make directory
sudo mkdir /var/www/html/key 1> /dev/null 2> /dev/null

#make file for parking
touch data/test
echo "selfHost" >> data/test


cd data

#use ssh-kegen to generate keys
# <test sends the contents of test to the command
# 1> sends the output of the command to nothing
ssh-keygen < test 1> /dev/null

#copy contents to website directory
sudo cp selfHost.pub /var/www/html/key 1> /dev/null
cd ../

exit 0
