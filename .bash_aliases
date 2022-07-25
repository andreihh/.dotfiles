# ~/.bash_aliases: this file contains various user-defined aliases for
# interactive shells.

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Open file with the default program.
alias o='xdg-open'

# Open current directory in a file explorer.
alias explore='nautilus .'

# Query NetworkManager or configure networking.
alias net='nmcli networking'

# Query or configure Wi-Fi in NetworkManager.
alias wifi='nmcli radio wifi'

# Print current screen resolution.
alias print-res='xrandr | head -n 3 | tail -n 1 | cut -d" " -f 4'

# Record desktop with 30 FPS to the given output file.
alias record='ffmpeg -video_size $(print-res) -f x11grab -i :0.0 -framerate 15'
