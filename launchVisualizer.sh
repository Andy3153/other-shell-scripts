#!/bin/sh
## vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
##
## launchVisualizer.sh by Andy3153
## created   18/10/22 ~ 11:47:12
##
## This script was made in order to start a visualizer on your screen to be used
## as a background window.
##
## Inspired by https://github.com/GuidoFe/visualizer
##
## Dependencies:
##    Required: rxvt-unicode cava
##

# {{{ Variables
transparency='0'
bg='black'
font='Iosevka Nerd Font'
fontsize='18'
bordersize='0'
# }}}

urxvt -bg "[$transparency]$bg" -fn "xft:$font:pixelsize=$fontsize" -b $bordersize -depth 32 +sb -sl 0 -e cava
