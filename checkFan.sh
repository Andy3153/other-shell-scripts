#!/bin/sh
##
## checkFan.sh by Andy3153
## created   03/09/21 ~ 15:30:21
## modified1 26/12/22 ~ 00:45:58
##
## This script was made in order to check the throttle thermal policy on Asus TUF laptops.
##
## Dependencies:
##    Required: sh inotify-tools
##    Optional: libnotify
##

# Variables
  _file="/sys/devices/platform/asus-nb-wmi/throttle_thermal_policy"

while [ $1 ]; do # Check for arguments
  while inotifywait --quiet --event modify $_file > /dev/null; do
    # Check for the value
      if [ $(cat $_file) = 0 ]
        then _message="Fan mode set to Normal."
	else if [ $(cat $_file) = 1 ]
               then _message="Fan mode set to Performance."
	       else if [ $(cat $_file) = 2 ]
                      then _message="Fan mode set to Silent."
		    fi
	     fi
      fi

    # Selecting showing method
      if [ "$1" = '--in-terminal' ] || [ "$1" = '-t' ]
       then echo $_message
       else if [ "$1" = '--in-notification' ] || [ "$1" = '-n' ]
              then notify-send --urgency=normal --expire-time=1500 --icon=indicator-sensors-fan --app-name="checkFan" "Fan Mode" "$_message"
	     fi
      fi
  done
done

# If there are no options, do this
printf "
 checkFan.sh by Andy3153
 Usage: checkFan.sh [OPTIONS..]

 Options:
  --in-terminal     , -t   Shows fan mode in the terminal.
  --in-notification , -n   Shows fan mode in a notification. Requires libnotify to be installed.

"


# End of file.
