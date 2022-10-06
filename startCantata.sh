#!/bin/sh
##
## startCantata.sh by Andy3153
## created 08/09/20 ~ 12:55:58
##
## This script was made in order to start MPD before Cantata, and to also start Discord RPC for MPD.
##
## Dependencies:
##    Required: sh systemd mpd cantata mpd-discord-rpc
##    Optional:
##

systemctl --user start mpd.service && \
mpd-discord-rpc & #&& \
cantata

killall mpd-discord-rpc #&& \
systemctl --user stop mpd.service #&& \
