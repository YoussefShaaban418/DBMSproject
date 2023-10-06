#!/bin/bash

while true
do
    read -p "[$dbname] Drop table <table name>: " tablename
    source TableValidation.sh 1
    if [[ $valid -eq 1 ]]
    then 
        break
    fi
done

rm $currentDB/DB/$dbname/$tablename
rm $currentDB/DB/$dbname/$tablename.meta
echo -e "${GREEN}---------------------------------------------------------------------${RESET}"
echo -e "${GREEN}------------------------Table [$tablename] is removed---------------${RESET}"
echo -e "${GREEN}---------------------------------------------------------------------${RESET}"
source QueryMenu.sh
