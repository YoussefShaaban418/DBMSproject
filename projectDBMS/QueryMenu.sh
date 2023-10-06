#!/bin/bash
PS3="[$dbname] operation number : "
select choice in "Create-Table" "Drop-Table" "Insert-Into-Table" "List-Tables" "Select-From-Table" "Delete-From-Table" "Update-Table" "Exit";
do
    case $REPLY in
        1) 
            source CreateTable.sh
	    ;;
        2) 
            source DropTable.sh
            ;;
        3) 
            source InsertIntoTable.sh 
            ;;
        4) 
            source ListTables.sh  
            ;;
        5) 
            source SelectFromTable.sh 
            ;;
        6)
            source DeleteFromTable.sh 
            ;;
        7)
            source updateTable.sh 
            ;;
        8)
            echo -e "${RED}---------------------------------------------------------------------${RESET}"
            cd $currentDB/DB
            source DBMenu.sh
            ;;
        *) 
            echo -e "${RED}---------------------------------------------------------------------${RESET}"
            echo -e "${RED}------------------------------wrong choise----------------------------${RESET}"
            echo -e "${RED}---------------------------------------------------------------------${RESET}"
    esac
done
