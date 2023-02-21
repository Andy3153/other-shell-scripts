#!/bin/sh
## vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
##
## flacmaxcompress by Andy3153
## created   20/01/23 ~ 14:03:41
##
## This script takes a folder as an argument, then recursively recompresses all
## the media files inside it and places them in the same structure in a clone
## folder.
## It does this by creating a copy of the original folder, then taking all
## copies and recompressing them, and deleting the copies.
##
## Why? Storage ain't cheap, but CPU is decent.
##

# {{{ Check if argument was given
origfolder=$(readlink -f "$1" 2> /dev/null)

if [ ! -d "$origfolder" ]; then
  echo "Not a folder."
  exit
fi
# }}}

# {{{ Create copy of files
workfolder="${origfolder}_recompressed"
cp -r "$origfolder" "$workfolder"
# }}}

# {{{ Run the conversion
find "$workfolder" -type f -exec sh -c \
  'file="{}" &&\
  file_noext=$(echo "$file" | sed -e "s/\.[^.]*$//")
  mv "$file" "$file_noext" &&\
  flac --verify -8 "$file_noext" -o "${file_noext}.flac" &&\
  rm "$file_noext"' \;
# }}}
