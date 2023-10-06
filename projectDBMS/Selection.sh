#!/bin/bash

while true
do
	read -p "[$dbname][$tablename] Select <Field name>: " fieldname
	source FieldValidation.sh 1
	if [[ $valid -eq 1 ]]
	then 
		break
	fi
done

FieldNum=`awk -F: -v fname=$fieldname '{if($1==fname)print NR}' $currentDB/DB/$dbname/$tablename.meta`;
FieldType=`awk -F: -v fnum=$FieldNum '{if(NR==fnum)print $2}' $currentDB/DB/$dbname/$tablename.meta`;
while true
do
	read -p "[$dbname][$tablename] Where [$fieldname] equal : " FieldValue
	source dataTypeValidation.sh
	if [ $valid -eq 1 ]	
	then
		break;
	fi
done

header=""
FieldName=`cut -d":" -f1 $currentDB/DB/$dbname/$tablename.meta`;
for field in $FieldName
do
    header+=${field^^}","
done

echo -e "${YELLOW}-------------Output data In [$dbname][$tablename] table------------${RESET}"
awk -F: -v fnum="$FieldNum" -v fvalue="$FieldValue" -v header="$header" '
  BEGIN {
    FS = ":"
    OFS = "|"
    split(header, headers)
  }
  $fnum == fvalue {
    for (i = 1; i <= NF; i++) {
      printf "%s%s", $i, (i == NF ? ORS : "|")
    }
  }
' $currentDB/DB/"$dbname"/"$tablename"
echo -e "${YELLOW}---------------------------------------------------------------------${RESET}"

source SelectMenu.sh
