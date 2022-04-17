#!/bin/sh
# File name: sendMessage.sh
# Author: Christopher B. DeLuca
# Date started: April 17th, 2022
# Description:
# file to post messages
#
#

echo "sendMessage.sh"

#Enter temp directory
cd data/tmp

#Collect message
echo "Please enter the message you would like to post\nPushing enter will prepare the message\n"
read message

#Create message file
echo $message >> message.tmp

#move to data folder
cd ../

#List keys in pub_keys folder
cd pub_keys
j=1
for i in $(ls)
do
	echo "$j. $i"
	j=$((j+1))
done

#Ask which key to encrypt with
read -p "Please pick a user to send to: " keychoice
PUBKEY=$(ls | head -n $keychoice | tail -n 1)
KEYNAME=$(ls | head -n $keychoice | tail -n 1 | cut -d '.' -f 1)
#KEYNAME=$($PUBKEY  | cut -d '.' -f 1)
cp $PUBKEY ../tmp
cd ../tmp

#Encrypt data
openssl rsautl -encrypt -inkey $PUBKEY -pubin -in message.tmp -out $KEYNAME.enc

#move file & delete original
sudo cp $KEYNAME.enc /var/www/html/selfHost/message/$KEYNAME.enc
rm *

#move back to main folder
cd ../../

exit 0

