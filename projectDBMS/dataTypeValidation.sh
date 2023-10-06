valid=1;
if [ $FieldType = "Int" ];
then
	if ! [[ $FieldValue =  +([0-9]) ]];
	then
		valid=0;
		echo -e "${YELLOW}---------------------------------------------------------------------${RESET}"
		echo -e "${YELLOW}----------------------The value should be int------------------------${RESET}"
		echo -e "${YELLOW}---------------------------------------------------------------------${RESET}"
	fi
else
	if ! [[ $FieldValue = [A-Za-z]*([A-Z]|[_@-]|[a-z]|[0-9]) ]];
	then
		valid=0;
		echo -e "${RED}---------------------------------------------------------------------${RESET}"
		echo -e "${RED}-----------The value should not contain Special characters-----------${RESET}"
		echo -e "${RED}---------------------------------------------------------------------${RESET}"	
	fi
fi
