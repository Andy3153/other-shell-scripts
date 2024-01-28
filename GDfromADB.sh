#!/usr/bin/env sh
##
## Pull Geometry Dash save files from Android using ADB
## Note: requires root
##

# {{{ Variables
steamroot="$HOME/games/steam" # Change to your liking

today=$(date +%4Y%m%dT%H%M%S)
gd_pc_location="${steamroot}/steamapps/compatdata/322170/pfx/drive_c/users/steamuser/AppData/Local"
gd_adb_location="/data/data/com.robtopx.geometryjump"
# }}}

# {{{ Functions
# {{{ Backup local files
backupLocal()
{
  mkdir -p "${gd_pc_location}/pcbaks/GeometryDash.bak.${today}"
  mv "${gd_pc_location}/GeometryDash/CCGameManager.dat" "${gd_pc_location}/pcbaks/GeometryDash.bak.${today}/"
  mv "${gd_pc_location}/GeometryDash/CCLocalLevels.dat" "${gd_pc_location}/pcbaks/GeometryDash.bak.${today}/"
  printf "\nBacking up local success.\n\n"
}
# }}}

# {{{ Backup ADB files
backupADB()
{
  mkdir -p "${gd_pc_location}/adbbaks/com.robtopx.geometryjump.${today}"
  adb pull "${gd_adb_location}/CCGameManager.dat" "${gd_pc_location}/adbbaks/com.robtopx.geometryjump.${today}"
  adb pull "${gd_adb_location}/CCLocalLevels.dat" "${gd_pc_location}/adbbaks/com.robtopx.geometryjump.${today}"
  printf "\nBacking up ADB success.\n\n"
}
# }}}

# {{{ Phone to PC
phonetopc()
{
  if backupLocal && backupADB
  then
    mkdir -p "${gd_pc_location}/GeometryDash"
    cp "${gd_pc_location}/adbbaks/com.robtopx.geometryjump.${today}/CCGameManager.dat" "${gd_pc_location}/GeometryDash"
    cp "${gd_pc_location}/adbbaks/com.robtopx.geometryjump.${today}/CCLocalLevels.dat" "${gd_pc_location}/GeometryDash"
    printf "\nPhone to PC success.\n\n"
  else printf "Backup failed!!! Exiting." ; exit 0
  fi
}
# }}}

# {{{ PC to phone
pctophone()
{
  if backupLocal && backupADB
  then
    adb push "${gd_pc_location}/pcbaks/GeometryDash.bak.${today}/CCGameManager.dat" "${gd_adb_location}/"
    adb push "${gd_pc_location}/pcbaks/GeometryDash.bak.${today}/CCLocalLevels.dat" "${gd_adb_location}/"
    printf "\nPC to phone success.\n\n"
  else printf "Backup failed!!! Exiting." ; exit 0
  fi
}
# }}}

# {{{ Help screen
helpScreen()
{
  printf "\
Usage: %s [OPTION]...\n\
Hate when cloud backup doesn't work?\n\
Seamlessly move Geometry Dash savefiles to and from phone using ADB\n\
\n\
  phonetopc   copy from phone to computer\n\
  pctophone   copy from computer to phone\n\
  help        display this help and exit\n\
\n\
https://github.com/Andy3153\n
" "$0"
}
# }}}

# {{{ No option screen
noOptionScreen()
{
  printf "\
Usage: %s [OPTION]...\n\
Try '%s help' for more information.\n
" "$0" "$0"

  exit 1
}
# }}}
# }}}

# {{{ Check for ADB requirements
if adb devices > /dev/null 2>&1
then sdf="sdf"
else printf "ADB could not find a device!!! Exiting.\n" ; exit 1
fi

if adb root > /dev/null 2>&1
then sdf="sdf"
else printf "ADB could not switch to root mode!!! Make sure your device is rooted. Exiting.\n" ; exit 1
fi
# }}}

# {{{ Parsing command-line options
case "$1" in
  "phonetopc" ) phonetopc ;;
  "pctophone" ) pctophone ;;
  "help" )      helpScreen ;;
  "" )          noOptionScreen ;;
esac
# }}}
