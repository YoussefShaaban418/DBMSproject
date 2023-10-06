#!/bin/bash

while true
do
    read -p "Connect DataBase <DataBase name>: " dbname
    source DatabaseValidation.sh 1
    if [[ $valid -eq 1 ]]
    then 
        break
    fi
done

echo -e "${GREEN}----------------------------------------------------------------------${RESET}"
echo -e "${GREEN}------------------ DataBase ["$dbname"] is connected -----------------${RESET}"
echo -e "${GREEN}----------------------------------------------------------------------${RESET}"
cd $currentDB/DB/$dbname
source QueryMenu.sh 

