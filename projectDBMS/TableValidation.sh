#!/bin/bash
valid=0
if [[ $tablename=[a-zA-Z]*([A-Z]|[_-]|[a-z]|[0-9]) ]];
then
    if [[ $1 -eq 0 ]]; # 0 for create table
    then
        if ! [[ -e $currentDB/DB/$dbname/$tablename ]];
        then
            valid=1
        else
            echo -e "${YELLOW}---------------------------------------------------------------------${RESET}"
            echo -e "${YELLOW}-----------------Table [$tablename] is alredy exist-----------------${RESET}"
            echo -e "${YELLOW}---------------------------------------------------------------------${RESET}"
        fi
    elif [[ $1 -eq 1 ]]; # for all
    then
        if ! [[ -e $currentDB/DB/$dbname/$tablename ]];
        then
            echo -e "${YELLOW}---------------------------------------------------------------------${RESET}"
            echo -e "${YELLOW}--------------------Table [$tablename] is not exist----------------${RESET}"
            echo -e "${YELLOW}---------------------------------------------------------------------${RESET}"
        else
            valid=1
        fi
    fi
else
    echo -e "${YELLOW}---------------------------------------------------------------------${RESET}"
    echo -e "${YELLOW}-----------The Table name not contain spechial characters------------${RESET}"
    echo -e "${YELLOW}---------------------------------------------------------------------${RESET}"
fi
