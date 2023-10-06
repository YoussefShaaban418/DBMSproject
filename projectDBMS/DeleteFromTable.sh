#!/bin/bash

while true
do
    read -p "[$dbname] Delete from table <table name>: " tablename
    source TableValidation.sh 1
    if [[ $valid -eq 1 ]]
    then 
        break
    fi
done

PS3="Enter Delete type number: "
before=$(wc -l < $currentDB/DB/$dbname/$tablename)
select choice in "Delete ALL Records" "Delete Specific Records"
do
    case $REPLY in
        1) 
            > $currentDB/DB/$dbname/$tablename
            break;;
        2)
            while true
            do
                read -p "[$dbname][$tablename] Where <Field name>: " fieldname
                source FieldValidation.sh 1
                if [[ $valid -eq 1 ]]
                then 
                    break
                fi
            done

            fieldnum=$( awk -F: -v fieldname=$fieldname '{if($1==fieldname)print NR}' $currentDB/DB/$dbname/$tablename.meta )
            FieldType=`awk -F: -v fnum=$fieldnum '{if(NR==fnum)print $2}' $currentDB/DB/$dbname/$tablename.meta`;
            while true
            do
                read -p "[$dbname][$tablename] Where [$fieldname] equal : " FieldValue
                source dataTypeValidation.sh
                if [ $valid -eq 1 ]	
                then
                    break;
                fi
            done
            
            touch $currentDB/DB/$dbname/temp
            awk -F: -v data=$FieldValue fieldnum=$fieldnum'{if($fieldnum!=data)print $0}' $currentDB/DB/$dbname/$tablename > $currentDB/DB/$dbname/temp
            cat $currentDB/DB/$dbname/temp > $currentDB/DB/$dbname/$tablename
            rm -f $currentDB/DB/$dbname/temp
            ;;
        *)  
            echo -e "${RED}----------------------------------------------------------------------${RESET}"
            echo -e "${RED}---------------------------- wrong choice ----------------------------${RESET}"
            echo -e "${RED}----------------------------------------------------------------------${RESET}"

    esac
done
after=$(wc -l < $currentDB/DB/$dbname/$tablename)
echo -e "${GREEN}----------------------------------------------------------------------${RESET}"
echo -e "${GREEN}-------------------"$(( $before - $after )) record is deleted"---------------------------${RESET}"
echo -e "${GREEN}---------------------------------------------------------------------${RESET}" 
source QueryMenu.sh
