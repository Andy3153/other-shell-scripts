#!/usr/bin/env/zsh
#
# startcantata.sh by Andy3153
# created 08/09/20 ~ 12:55:58
#

systemctl --user start mpd.service && \
mpd-discord-rpc & #&& \
cantata

killall mpd-discord-rpc #&& \
systemctl --user stop mpd.service #&& \
