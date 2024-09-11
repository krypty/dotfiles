alias yt-dlp-playlist="yt-dlp --all-subs -o '%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s' "
alias yt-dlp-mp3="yt-dlp -o '%(title)s-%(id)s.%(ext)s' -x --audio-format mp3 --audio-quality 0"
alias yt-dlp-playlist-mp3="yt-dlp-playlist -x --audio-format=mp3 --audio-quality=0 "
