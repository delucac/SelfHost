#!/bin/sh
# File name: key.sh
# Author: Christopher B. DeLuca
# Date started: April 16th, 2022
# Description:
# Utility to collect public key from friend
#
#

#echo "pubKey.sh"
clear

#loop for users to collect multiple keys
keyrun=5

while [ $keyrun -gt 1 ]
do

echo "=== Public key management ==="
echo "1. Collect public key"
#echo "2. Public key management"
echo "E. return to main menu"
read -p "Please make a selection: " keychoice
echo "\n"

case $keychoice in
	1)
		read -p "please enter the ip address of your friend: " ip
		read -p "Please enter the name your friend used: " name
		cd data/pub_keys
		wget $ip/selfHost/key/$name.pub.pem
		cd ../../
	;;
	2)
		#echo "manage public keys"
		cd data/pub_keys
		j=1
		for i in $(ls)
		do
			echo "$j. $i"
			j=$((j+1))
		done
		read -p "Please pick a key to manage: " keychoice
		echo $(ls | head -n $keychoice | tail -n 1)
		cd ../../
		keyrun=0
	;;
	[eE])
		keyrun=0
	;;
	*)
		clear
		echo "Error: invalid value"
	;;
esac
done
exit 0
