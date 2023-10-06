#!/bin/bash
PS3="Enter DB operation number: "
select choice in "CreateDB" "ConnectDB" "ListDB" "DropDB" "Exit";
do
    case $REPLY in
        1) 
            source CreateDB.sh
            ;;
        2) 
            source ConnectDB.sh
            ;;
        3) 
            source ListDB.sh
            ;;
        4) 
            source DropDB.sh
            ;;
        5) 
            ;;
        *) 
            echo -e "${RED}----------------------------------------------------------------------${RESET}"
            echo -e "${RED}---------------------------- wrong choice ----------------------------${RESET}"
            echo -e "${RED}----------------------------------------------------------------------${RESET}";;
    esac
done
