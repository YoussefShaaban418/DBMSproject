#!/bin/bash
while true
do
    read -r -p "Create DataBase <DataBase name>: " dbname
    source DatabaseValidation.sh 0
    if [[ $valid -eq 1 ]]
    then 
        break
    fi
done

mkdir $currentDB/DB/$dbname
echo -e "${GREEN}--------------------------------------------------------------------------------------------------${RESET}"
echo -e "${GREEN}------------------------------------ DataBase $dbname is Added -----------------------------------${RESET}"
echo -e "${GREEN}--------------------------------------------------------------------------------------------------${RESET}"
source DBMenu.sh

