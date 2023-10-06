#!/bin/bash
header=""
FieldName=`cut -d":" -f1 $currentDB/DB/$dbname/$tablename.meta`;
for field in $FieldName
do
    header+=${field^^}"," # ^^ for capitalization
done

echo -e "${GREEN}---------------All data In [$dbname][$tablename] table--------------${RESET}"
#cat $currentDB/DB/$1/$2 #read all data in table
awk -v header="$header" -F':' 'BEGIN { OFS = "|" } 
	NR == 1 { split(header, headers); next } { 
	for (i = 1; i <= NF; i++) 
	{ printf "%s%s", $i, (i == NF ? ORS : "|") } }' $currentDB/DB/"$dbname"/"$tablename"

echo -e "${GREEN}---------------------------------------------------------------------${RESET}"
source SelectMenu.sh
