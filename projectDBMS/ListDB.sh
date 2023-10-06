#!/bin/bash
echo -e "${GREEN}---------------------All Databases In The System--------------------${RESET}"
ls -F $currentDB/DB | grep / | cut -f1 -d/ 
echo -e "${GREEN}---------------------------------------------------------------------${RESET}"
source DBMenu.sh
