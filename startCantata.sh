#!/bin/sh
##
## startCantata.sh by Andy3153
## created   08/09/20 ~ 12:55:58
## modified1 19/01/23 ~ 19:57:21
##
## This script was made in order to start Discord RPC for MPD before starting
## Cantata.
##
## Dependencies:
##   cantata mpd-discord-rpc
##

mpd-discord-rpc & #&& \
cantata

killall mpd-discord-rpc #&& \
