#!/bin/bash
# shopt -s extglob
echo -e "${GREEN}---------------------------------------------------------------------${RESET}"
echo -e "${GREEN}-----------------All Tables In [$dbname] database--------------------${RESET}"
ls -I "*.meta" | column 
echo -e "${GREEN}---------------------------------------------------------------------${RESET}"
source QueryMenu.sh
