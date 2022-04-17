#!/bin/sh
# File name: SelfHost.sh
# Author: Christopher B. DeLuca
# Date started: April 6th, 2022
# Description:
# Modular script for setting up self hosted services
#
#

#welcome user
clear
echo "Welcome. Please make a selection below"
run=5

#Main loop for program
while [ $run -gt 1 ]
do

#main menu
echo "=== Menu ==="
echo "1. Setup configuration"
echo "2. Install static website"

#Want to use npm for dynamic website, however due to time will likely be cut
#echo "3. Install dynamic website"
#SMTP may be swapped for wget or other plans...
#echo "4. Install mail server"

echo "3. Setup secure chat"
echo "4. public key management"

echo "0. Open About Website"
echo "E. Exit"

read -p "Please make a selection: " choice
echo "\n"

#cases for menu input
case $choice in
	1) #Setup data & configs
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
                if [ -d ./modules/webpages ]
                then
                        echo "modules folder exists\n"
                fi
                if [ ! -d ./modules/webpages ]
                then
                        echo "Creating modules folder\n"
                        mkdir modules/webpages
                fi

	;;
	2) #install static website (apache2)
		if [ -e "./modules/staticWeb.sh" ]
		then
			chmod 700 ./modules/staticWeb.sh
			./modules/staticWeb.sh
			echo "Returning to main menu\n"
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
					echo "Returning to main menu\n"
				;;
				[nN]*)
					echo "returning to menu"
				;;
			esac
		fi

	;;
	#Basically runs & configures the everything to setup chat
	3)
		if [ -e "./modules/chatSetup.sh" ]
		then
			chmod 700 ./modules/chatSetup.sh
			./modules/chatSetup.sh
			echo "Returning to main menu\n"
		fi

                if [ ! -e "./modules/chatSetup.sh" ]
                then
                        echo "Module not present"
                        read -p "Would you like to download the file? (y/n): " prompt
                        case $prompt in
                                [yY]*)
                                        echo "downloading file"
                                        cd modules
					wget https://raw.githubusercontent.com/delucac/SelfHost/main/modules/chatSetup.sh
                                        chmod 700 chatSetup.sh
                                        cd ../
                                        ./modules/chatSetup.sh
					echo "Returning to main menu\n"
                                ;;
                                [nN]*)
                                        echo "Returning to menu"
                                ;;
                        esac
                fi

	;;
	#script to collect public keys from users
	4)
		if [ -e "./modules/pubKey.sh" ]
		then
			chmod 700 ./modules/pubKey.sh
			./modules/pubKey.sh
			echo "Returning to menu"
		fi

		if [ ! -e "./modules/pubKey.sh" ]
		then
			echo "Module not present"
			read -p "Would you like to download the file? (y/n): " prompt
			case $prompt in
				[yY])
					echo "downloading file"
					cd modules
					wget https://raw.githubusercontent.com/delucac/SelfHost/main/modules/pubKey.sh
					chmod 700 pubKey.sh
					cd ../
					./modules/pubKey.sh
					echo "Returing to main menu\n"
				;;
				*)
					echo "Returning to menu"
				;;
			esac
		fi
	;;
	#About, pretty self explanatory
	0)
		xdg-open https://github.com/delucac/SelfHost 1> /dev/null 2> /dev/null
		echo "Opening website"
		echo "\n"
		#read -p "Push enter to return to menu" trash
	;;

	#case allows for e or E, regex is pretty useful
	#Exit program
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

#finish script
clear
echo "Thank you for using SelfHost"
exit 0