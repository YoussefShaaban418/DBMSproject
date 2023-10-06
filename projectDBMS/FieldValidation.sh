#!/bin/bash
valid=0
if [[ $fieldname = [A-Za-z]*([A-Z]|[_-]|[a-z]|[0-9]) ]];
then
    if [[ $1 -eq 0 ]]; # 0 for create field
    then
        if ! [[ $(cut -d":" -f 1 $tablename".meta" | grep -w "^$fieldname$") ]];
        then
            valid=1
        else
            echo -e "${YELLOW}---------------------------------------------------------------------${RESET}"
            echo -e "${YELLOW}------------------Field [$fieldname] is alredy exist-----------------${RESET}"
            echo -e "${YELLOW}---------------------------------------------------------------------${RESET}"
        fi
    elif [[ $1 -eq 1 ]]; # for all
    then
        if ! [[ $(cut -d":" -f 1 $tablename".meta" | grep -w "^$fieldname$") ]]; # echo $? for condition
        then
            echo -e "${YELLOW}---------------------------------------------------------------------${RESET}"
            echo -e "${YELLOW}--------------------Field [$fieldname] is not exist------------------${RESET}"
            echo -e "${YELLOW}---------------------------------------------------------------------${RESET}"
        else
            valid=1
        fi
    fi
else
    echo -e "${YELLOW}---------------------------------------------------------------------${RESET}"
    echo -e "${YELLOW}-------- The database name not contain spechial characters ----------${RESET}"
    echo -e "${YELLOW}---------------------------------------------------------------------${RESET}"
fi
