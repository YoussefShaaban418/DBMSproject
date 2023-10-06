#!/bin/bash
valid=0
if [[ $dbname = [A-Za-z]*([A-Z]|[_-]|[a-z]|[0-9]) ]];
then
    if [[ $1 -eq 0 ]]; # 0 for create database
    then
        if ! [[ -e $currentDB/DB/$dbname ]];
        then
            valid=1
        else
            echo -e "${RED}---------------------------------------------------------------------${RESET}"
            echo -e "${RED}----------------- DataBase ["$dbname"] is alredy exist --------------${RESET}"
            echo -e "${RED}---------------------------------------------------------------------${RESET}"
            
        fi
    elif [[ $1 -eq 1 ]]; # 1 for connect, and delete database
    then
        if ! [[ -e $currentDB/DB/$dbname ]];
        then
            echo -e "${YELLOW}---------------------------------------------------------------------${RESET}"
            echo -e "${YELLOW}----------------- DataBase ["$dbname"] is not exist ---------------${RESET}"
            echo -e "${YELLOW}---------------------------------------------------------------------${RESET}"
            
        else
            valid=1
        fi
    fi
else
    echo -e "${RED}---------------------------------------------------------------------${RESET}"
    echo -e "${RED}----------The database name not contain spechial characters----------${RESET}"
    echo -e "${RED}---------------------------------------------------------------------${RESET}"
fi
