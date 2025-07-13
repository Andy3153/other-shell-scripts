#!/bin/sh
##
## Replace part of BeamNG's default UI apps with my setup
##

# {{{ What apps to remove
export removeapps='
.appName=="forcedInduction" or
.appName=="simplePowertrainControl" or
.appName=="tacho2" or
.appName=="damageApp" or
.appName=="simpleDigSpeedoAir" or
.appName=="simpleGears" or
.appName=="simpleDigSpeedo" or
.appName=="navigation" or
.appName=="gforcesDebug" or
.appName=="simplePedals" or
.appName=="simpleSteering" or
.appName=="simpleTacho" or
.appName=="simpleDash" or
.appName=="fuelntempTemp"
'
# }}}

# {{{ What apps to add
export addapps='
{
  "appName":"forcedInduction",
  "placement":{
    "bottom":"0px",
    "height":"90px",
    "left":"",
    "position":"absolute",
    "right":"625px",
    "top":"",
    "width":"90px"
  }
},
{
  "appName":"simplePowertrainControl",
  "placement":{
    "bottom":"40px",
    "height":"162.546875px",
    "left":"",
    "position":"absolute",
    "right":"0px",
    "top":"",
    "width":"220px"
  }
},
{
  "appName":"damageApp",
  "placement":{
    "bottom":"225px",
    "height":"270px",
    "left":"0px",
    "position":"absolute",
    "right":"",
    "top":"",
    "width":"152.09375px"
  }
},
{
  "appName":"simpleDigSpeedoAir",
  "placement":{
    "bottom":"0px",
    "height":"50px",
    "left":"780px",
    "position":"absolute",
    "right":"",
    "top":"",
    "width":"120px"
  }
},
{
  "appName":"simpleGears",
  "placement":{
    "bottom":"0px",
    "height":"50px",
    "left":0,
    "margin":"auto",
    "position":"absolute",
    "right":0,
    "top":"",
    "width":"120px"
  }
},
{
  "appName":"simpleDigSpeedo",
  "placement":{
    "bottom":"0px",
    "height":"50px",
    "left":"",
    "position":"absolute",
    "right":"780px",
    "top":"",
    "width":"120px"
  }
},
{
  "appName":"navigation",
  "placement":{
    "bottom":"0px",
    "height":"225px",
    "left":"0px",
    "position":"absolute",
    "right":"",
    "top":"",
    "width":"320px"
  }
},
{
  "appName":"gforcesDebug",
  "placement":{
    "bottom":"0px",
    "height":"90px",
    "left":"625px",
    "position":"absolute",
    "right":"",
    "top":"",
    "width":"90px"
  }
},
{
  "appName":"simplePedals",
  "placement":{
    "bottom":"0px",
    "height":"110px",
    "left":"320px",
    "position":"absolute",
    "right":"",
    "top":"",
    "width":"150px"
  }
},
{
  "appName":"simpleSteering",
  "placement":{
    "bottom":"110px",
    "height":"93.75px",
    "left":"320px",
    "position":"absolute",
    "right":"",
    "top":"",
    "width":"150px"
  }
},
{
  "appName":"simpleTacho",
  "placement":{
    "bottom":"5px",
    "height":"163.640625px",
    "left":0,
    "margin":"auto",
    "position":"absolute",
    "right":0,
    "top":"",
    "width":"490px"
  }
},
{
  "appName":"simpleDash",
  "placement":{
    "bottom":"0px",
    "height":"40px",
    "left":"",
    "position":"absolute",
    "right":"0px",
    "top":"",
    "width":"240px"
  }
},
{
  "appName":"fuelntempTemp",
  "placement":{
    "bottom":"0px",
    "height":"50px",
    "left":"",
    "position":"absolute",
    "right":"240px",
    "top":"",
    "width":"100px"
  }
}
'
# }}}

# {{{ Check if argument was given
origfolder=$(readlink -f "${1}" 2> /dev/null)

if [ ! -d "${origfolder}" ]; then
  echo "Not a folder."
  exit
fi
# }}}

# {{{ Create copy of files
workfolder="${origfolder}_modified"
cp -r "${origfolder}" "${workfolder}"
# }}}

# {{{ Run
find "${workfolder}" -type f -exec sh -c \
  'file="{}" &&\
  jq "del(.apps[] | select($removeapps))" $file > $file.1 &&\
  jq ".apps += [$addapps]" $file.1 > $file.2 &&\
  jq "." $file.2 > $file
  rm $file.1 $file.2' \;
# }}}
