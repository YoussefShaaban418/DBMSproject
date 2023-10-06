#!/bin/bash
# Enter number of fields
FieldArr=""
while true
    read -p "[$dbname][$tablename] Number of Fields : " Fcount;
    do
        if [[ $Fcount = +([0-9]) ]]
        then
            break
        fi
    done


echo -e "${YELLOW}---------------------------------------------------------------------${RESET}"
echo -e "${YELLOW}------------ The dublicated column will be print once ---------------${RESET}"
echo -e "${YELLOW}---------------------------------------------------------------------${RESET}"


# touch $currentDB/DB/$dbname/header # file for display header
touch $currentDB/DB/$dbname/headerNum
touch $currentDB/DB/$dbname/headerNumPrint
header=""

while (( $Fcount > 0 ))
do
    while true
    do
        read -p "[$dbname][$tablename] Select <Field name>: " fieldname
        source FieldValidation.sh 1
        if [[ $valid -eq 1 ]]
        then 
            break
        fi
    done

    # for create -f for cut like this -----> 1,2,3,4
    FieldNum=`awk -F: -v fname=$fieldname '{if($1==fname)print NR}' $currentDB/DB/$dbname/$tablename.meta`;
    
    if [ $Fcount -eq 1 ]
    then
        FieldArr=$FieldArr$FieldNum;
    else
        FieldArr=$FieldArr$FieldNum",";
    fi
    Fcount=$(( Fcount - 1));

    if ! [[ $(grep -w "^$FieldNum$" $currentDB/DB/$dbname/headerNum) ]];
    then
    	echo $FieldNum >> $currentDB/DB/$dbname/headerNum;
        # echo $fieldname >> $currentDB/DB/$dbname/header
    fi
    
done

sort $currentDB/DB/$dbname/headerNum | uniq > $currentDB/DB/$dbname/headerNumPrint;
fieldHeader=`cat $currentDB/DB/$dbname/headerNumPrint`;
for num in $fieldHeader
do
	headerTemp=`awk -F: -v fnum=$num '{if(NR==fnum)print $1}' $currentDB/DB/$dbname/$tablename.meta`;
	header+=${headerTemp^^};
	header+=",";
done


echo -e "${YELLOW}-------------Output data In [$dbname][$tablename] table--------------${RESET}"
awk -F: -v fieldArr="$FieldArr" -v header="$header" '
  BEGIN {
    FS = ":"
    OFS = "|"
    split(fieldArr, fields, " ")
    split(header, headers)
  }
  {
    for (i = 1; i <= length(fields); i++) {
      printf "%s%s", $fields[i], (i == length(fields) ? ORS : "|")
    }
  }
' $currentDB/DB/"$dbname"/"$tablename"
echo -e "${YELLOW}---------------------------------------------------------------------${RESET}"
rm -f $currentDB/DB/$dbname/header*
source SelectMenu.sh
