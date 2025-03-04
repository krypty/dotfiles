alias reload-xresources="xrdb ~/.Xresources"
alias xopen="gio open"
alias mv='mv -i'
alias :q="exit"
alias calc="loffice --calc"
alias jp="jupyter-notebook"
alias fd="fd -H"
alias i3c="$EDITOR ~/.config/i3/config"
alias m="make"
alias wtr="curl 'http://wttr.in/lausanne?lang=fr'"
alias cmake="cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1"
alias vihosts="sudoedit /etc/hosts"
alias v="$EDITOR"
alias glow="glow -p"
alias xsel="xsel --clipboard"
alias cal="cal -w -m"

function fe() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

function fd {
    (which fdfind &> /dev/null && fdfind "$@") || $(which fd 2>/dev/null) "$@"
}

# Setup NNN
alias update-nnn-plugs="curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh"

n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn -e -P p "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

alias lf="lfrun"
