#!/bin/sh
# File name: grabMessage.sh
# Author: Christopher B. DeLuca
# Date started: April 17th, 2022
# Description:
# file to retrieve messages
#
#

echo "grabMessage.sh"

#get ip & name to collect
read -p "Please enter the ip address of your friend: " ip
cd data/keys
name=$(ls | head -n 1 | tail -n 1 | cut -d '.' -f 1)

#move to tmp directory
cd ../tmp

#download message
wget $ip/selfHost/message/$name.enc

#copy perm file
cp ../keys/$name.pem ./

#Decrypt data
openssl rsautl -decrypt -inkey $name.pem -in $name.enc > $name.txt
clear
echo "=====message====="
cat $name.txt
echo "\n\n"
read -p "Push enter to close message" trash

#remove tmp files
rm *

#return to main
cd ../../

exit 0

