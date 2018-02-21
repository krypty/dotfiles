#!/bin/bash

shopt -s globstar

for a in /home/gary/Music/{,**/}*.{flac,mp3}; do
  # b=$(basename "$a")
  dest=${a/\/home\/gary\/Music\//}
  mkdir -p "$(dirname "$dest")"

  if [ ${a: -5} == ".flac" ]
  then
    dest=${dest/%flac/mp3}
    ffmpeg -n -i "$a" -qscale:a 0 "$dest"
  else
    rsync --progress "$a" "$dest"
  fi

done
