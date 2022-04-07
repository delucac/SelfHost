#!/bin/sh
# File name: SelfHost.sh
# Author: Christopher B. DeLuca
# Date started: April 6th, 2022
# Description:
# Modular script for setting up self hosted services
#
#

clear
echo "Welcome. Please make a selection below"
run=5
while [ $run -gt 1 ]
do

echo "===Menu==="
echo "1. Setup configuration"
echo "2. Install static website"
#echo "3. Install dynamic website"
#echo "4. Install mail server"
#echo "0. About"
echo "E. Exit"

read -p "Please make a selection: " choice
echo "\n"
case $choice in
	1)
		if [ -d ./data/ ]
		then
			echo "Data files already exist\n"
		fi

		if [ ! -d ./data/ ]
		then
			echo "Creating data files\n"
			mkdir data
		fi
		if [ -d ./modules/ ]
		then
			echo "modules folder exists\n"
		fi
		if [ ! -d ./modules/ ]
		then
			echo "Creating modules folder\n"
			mkdir modules
		fi
	;;
	2)
		if [ -e "./modules/staticWeb.sh" ]
		then
			chmod 700 ./modules/staticWeb.sh
			./modules/staticWeb.sh
			echo "Returning to main script\n"
		fi

		if [ ! -e "./modules/staticWeb.sh" ]
		then
			echo "Module not present"
			read -p "Would you like to download the file? (y/n): " prompt
			case $prompt in
				[yY]*)
					echo "downloading file"
					cd modules
					wget https://raw.githubusercontent.com/delucac/SelfHost/main/modules/staticWeb.sh
					chmod 700 staticWeb.sh
					cd ../
					./modules/staticWeb.sh
				;;
				[nN]*)
					echo "returning to menu"
				;;
			esac
		fi

	;;

	#case allows for e or E
	[eE])
		run=0
	;;

	#Error checking/default
	*)
		clear
		echo "Error: invalid value"
	;;
esac
done

clear
echo "Thank you for using this script"
exit 0
