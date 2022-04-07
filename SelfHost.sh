#!/bin/sh
# File name: SelfHost.sh
# Author: Christopher B. DeLuca
# Date started: April 6th, 2022
# Description:
# Modular script for setting up self hosted services
#
#
#

clear
echo "Welcome. Please make a selection below"
run=5
while [ $run -gt 1 ]
do

echo "Menu"
echo "1. Setup configuration"
echo "2. Install static website"
echo "3. Install dynamic website"
echo "4. Install mail server"
echo "0. About\n"
echo "E. Exit"

read -p "Please make a selection: " choice

case $choice in
	1)
		mkdir data 
	;;

	e)
		run=0
	;;
	E)
		run=0
	;;
	*)
		clear
		echo "Error: invalid value"
	;;
esac
done

clear
echo "Thank you for using this script"
exit 0
