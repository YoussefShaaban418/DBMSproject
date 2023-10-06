PS3="Enter query operation number [$dbname][$tablename] : "
select choice in "Select-All" "Selection" "Projection" "Exit";
do
    case $REPLY in
        1) 
            source SelectAll.sh
	    ;;
        2) 
            source Selection.sh
            ;;
        3) 
            source Projection.sh
            ;;
        4)
            echo -e "${RED}---------------------------------------------------------------------${RESET}"
            source QueryMenu.sh
            ;;
        *) 
            echo -e "${RED}---------------------------------------------------------------------${RESET}"
            echo -e "${RED}--------------------------------wrong choise-------------------------${RESET}"
            echo -e "${RED}---------------------------------------------------------------------${RESET}"
    esac
done
