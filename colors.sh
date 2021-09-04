#!/bin/zsh
#  __                            _         _     
# / _| ___  _ __ _ __ ___   __ _| |_   ___| |__  
#| |_ / _ \| '__| '_ ` _ \ / _` | __| / __| '_ \ 
#|  _| (_) | |  | | | | | | (_| | |_ _\__ \ | | |
#|_|  \___/|_|  |_| |_| |_|\__,_|\__(_)___/_| |_|
#                                     by Andy3153
#
# Source this in your script to add variables for colors and formatting
# Or execute it normally and get instructions on how to use them
#

if [ "${BASH_SOURCE[0]}" != "${0}" ]
then 
     FRM_NS='\033[0m'        #Normal Style (no color/formatting)
     
     FRM_BOLD='\033[1m'      #Bold
     FRM_DIM='\033[2m'       #Dim
     FRM_ITAL='\033[3m'      #Italic
     FRM_ULINE='\033[4m'     #Underline
     FRM_BLINK='\033[5m'     #Blink
     FRM_RVRS='\033[7m'      #Reverse
     FRM_INVIS='\033[8m'     #Invisible
     
     
     CLR_BLK='\033[0;30m'    #Black
     CLR_RED='\033[0;31m'    #Red
     CLR_GRN='\033[0;32m'    #Green
     CLR_BRWN='\033[0;33m'   #Brown/Orange
     CLR_BLUE='\033[0;34m'   #Blue
     CLR_PRPL='\033[0;35m'   #Purple
     CLR_CYAN='\033[0;36m'   #Cyan
     CLR_L_GRAY='\033[0;37m' #Light Gray
     
     CLR_D_GRAY='\033[1;30m' #Dark Gray
     CLR_L_RED='\033[1;31m'  #Light Red
     CLR_L_GRN='\033[1;32m'  #Light Green
     CLR_YLLW='\033[1;33m'   #Yellow
     CLR_L_BLUE='\033[1;34m' #Light Blue
     CLR_L_PRPL='\033[1;35m' #Light Purple
     CLR_L_CYAN='\033[1;36m' #Light Cyan
     CLR_WHT='\033[1;37m'    #White
     
     
else 

     
     echo not sourced
     
fi
