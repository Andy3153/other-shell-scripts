#!/bin/zsh
##
## manpdf.sh by Andy3153
## created 09/11/19 ~ 20:15:33
## remade  27/10/20 ~ 15:37:08
##

# Variables
  # Manpage file name
    _manpdfshFileName="manpage-$1-$(date +"%d.%m.%y~%H:%M:%S").pdf"

  # The folder it will be placed on
    _manpdfshFolder="/tmp/manpdf.sh/$USER/"

  # Prompt variables
    _manpdfshPrompt="\033[1m[ \033[1;33mmanpdf.sh\033[0m ]\033[0m : "
    _manpdfshErrPrompt="\033[1m[ \033[1;33mmanpdf.sh\033[0m ]\033[0m :\033[5m \033[1mERROR! \033[0m\033[0m"

# Making the folder the manpage will be stored in
  if [ -e $_manpdfshFolder ]
    then printf "$_manpdfshPrompt Directory already exists, skipping...\n"
    else mkdir -p -m 777 $_manpdfshFolder
    chmod a+rwx $_manpdfshFolder
  fi

# Putting the contents for the manpage in it
  man -Tpdf $1 1> "$_manpdfshFolder/$_manpdfshFileName" 2> /dev/null

  if [ ! $(find $_manpdfshFolder -empty -name $_manpdfshFileName) ]
  then
       # Reads the manpage with the default PDF viewer
         printf "$_manpdfshPrompt Opening PDF...\n"
         xdg-open "$_manpdfshFolder/$_manpdfshFileName" &

       # Exits script
         printf "$_manpdfshPrompt Done! Exit script.\n"
         exit
  else
       # Script errors out
         printf "$_manpdfshErrPrompt manpage doesn't exist! Exit script.\n"
         exit
  fi


## End of file.
