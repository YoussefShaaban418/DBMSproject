#!/bin/bash

while true
do
    read -p "Drop DataBase <DataBase name>: " dbname
    source DatabaseValidation.sh 1
    if [[ $valid -eq 1 ]]
    then 
        break
    fi
done

rm -r $currentDB/DB/$dbname
echo -e "${GREEN}---------------------------------------------------------------------${RESET}"
echo -e "${GREEN}------------------DataBase [$dbname] is removed------------------${RESET}"
echo -e "${GREEN}---------------------------------------------------------------------${RESET}"
source DBMenu.sh
