alias youtube-dl-playlist="youtube-dl --all-subs -o '%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s' "
alias youtube-dl-mp3="youtube-dl -o '%(title)s-%(id)s.%(ext)s' -x --audio-format mp3 --audio-quality 0"
alias youtube-dl-playlist-mp3="youtube-dl-playlist -x --audio-format=mp3 --audio-quality=0 "
