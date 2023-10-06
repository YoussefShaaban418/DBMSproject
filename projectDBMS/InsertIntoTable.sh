#!/bin/bash

# table name validation
while true
do
    read -p "[$dbname] Insert into table <table name>: " tablename
    source TableValidation.sh 1
    if [[ $valid -eq 1 ]]
    then 
        break
    fi
done


NumOfRecord=0;
while true
do
	NumOfRecord=$(( NumOfRecord + 1));
	FieldName=`cut -d":" -f1 $currentDB/DB/$dbname/$tablename.meta`;
	i=0;
	for field in $FieldName;
	do
		FieldType=`awk -F: -v fname=$field '{if($1==fname)print $2}' $currentDB/DB/$dbname/$tablename.meta`;
		if [ $i -eq 0 ] #check the primary key should be unique
		then
			while true
			do
				read -p "[$dbname][$tablename] Insert into [$field] <primary key> : " FieldValue
				source dataTypeValidation.sh;
				if [ $valid -eq 1 ]
				then
					if [[ $(cut -d":" -f 1 $tablename | grep -w "^$FieldValue$") ]];
				    	then
						echo -e "${YELLOW}---------------------------------------------------------------------${RESET}"
						echo -e "${YELLOW}--------------------primary key should be unique---------------------${RESET}"
						echo -e "${YELLOW}---------------------------------------------------------------------${RESET}" 
					else
						break
					fi
				fi
			done
			InsertRow="$FieldValue";
		else #insert any other value withen DB constrain (Int or String) 
			while true
			do
				read -p "[$dbname][$tablename] Insert into [$field] : " FieldValue
				source dataTypeValidation.sh;
				if [ $valid -eq 1 ]	
				then
					break;
				fi	
			done
			InsertRow=$InsertRow":"$FieldValue;
		fi
		i=$(( i + 1));
	done
	read -N 1 -p "Do you want to insert another record [y/n]? " check
        if [[ $check = "y" ]]
        then
            echo
            echo $InsertRow >> $currentDB/DB/$dbname/$tablename;
            continue 
        elif [[ $check = "n" ]] 
        then
            echo
            break 
        else
            break 
        fi
done
echo $InsertRow >> $currentDB/DB/$dbname/$tablename;
echo -e "${GREEN}---------------------------------------------------------------------${RESET}"
echo -e "${GREEN}------------------------$NumOfRecord record is inserted------------------------${RESET}"
echo -e "${GREEN}---------------------------------------------------------------------${RESET}" 
source QueryMenu.sh
