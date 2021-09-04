#!/usr/bin/env bash
#
# launchMC.sh by Andy3153
# remade 09/05/21 ~ 23:22:59
#

root_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )" # variable to the root directory

minecraft-launcher --workDir="$root_dir/Data Folder"

# End of file
