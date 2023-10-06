#!/bin/bash
#the best DBMS ever made by Youssef Shaaban & Amr mohamed
source currentDB.sh
shopt -s extglob
GREEN="\e[32m"
YELLOW="\e[33m"
RED="\e[31m"
RESET="\e[0m"

echo -e "${GREEN}"
cat << "EOF"
$$$$$$$\  $$$$$$$\  $$\      $$\  $$$$$$\  
$$  __$$\ $$  __$$\ $$$\    $$$ |$$  __$$\ 
$$ |  $$ |$$ |  $$ |$$$$\  $$$$ |$$ /  \__|
$$ |  $$ |$$$$$$$\ |$$\$$\$$ $$ |\$$$$$$\  
$$ |  $$ |$$  __$$\ $$ \$$$  $$ | \____$$\ 
$$ |  $$ |$$ |  $$ |$$ |\$  /$$ |$$\   $$ |
$$$$$$$  |$$$$$$$  |$$ | \_/ $$ |\$$$$$$  |
\_______/ \_______/ \__|     \__| \______/                                                      
EOF
echo -e "${RESET}"
echo -e "${YELLOW}Welcome to Our Awesome Database Management System${RESET}"
echo -e "${GREEN}------------------------------------------------------------${RESET}"

PS3="Enter your choice number: "
select choice in "Enter to DBMS system" "Exit";
do
    case $REPLY in
        1) 
            if ! [[ -e $currentDBS/DB ]];
            then
                mkdir $currentDBS/DB
            fi
            cd $currentDBS/DB
	        echo -e "${YELLOW}---------------------------------------------------------------------${RESET}"
            source DBMenu.sh
            ;;
        2) 
            ;;
        *) 
            echo -e "${RED}----------------------------------------------------------------------${RESET}"
            echo -e "${RED}---------------------------- wrong choice ----------------------------${RESET}"
            echo -e "${RED}----------------------------------------------------------------------${RESET}";;
    esac
done





#please connect us:
#Gmail: Youssef.Shaaban418@gmail.com
#phone: +20 115 115 7975
#phone: +20 122 378 7766











