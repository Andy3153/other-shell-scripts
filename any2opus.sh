#!/bin/sh
## vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
##
## any2opus by Andy3153
## created   20/01/23 ~ 01:02:52
##
## This script takes a folder as an argument, then recursively converts all
## the audio files inside it and places them in the same structure in a clone
## folder.
## It does this by creating a copy of the original folder, then taking all
## copies and converting them, and deleting the copies.
##
## Why? Storage on phones ain't cheap.
##
## Ways I've considered going at it:
##   opusenc input output                         -- keeps all tags and albumart (using currently)
##   ffmpeg -i input -c:a libopus output          -- doesn't keep albumart but supports much more input filetypes
##   ffmpeg -i input -f wav - | opusenc - output  -- no idea why i tried this
##

# {{{ Check if argument was given
origfolder="$(readlink -f $1 2> /dev/null)"

if [ ! -d "$origfolder" ]; then
  echo "Not a folder."
  exit
fi
# }}}

# {{{ Create copy of files
workfolder="${1}_opus"
cp -r "$1" "$workfolder"
# }}}

# {{{ Run the conversion
find "$workfolder" -type f -exec sh -c \
  'file="{}" &&\
  file_noext=$(echo "$file" | sed -e "s/\.[^.]*$//")
  mv "$file" "$file_noext" &&\
  opusenc "$file_noext" "${file_noext}.opus" &&\
  rm "$file_noext"' \;
# }}}
