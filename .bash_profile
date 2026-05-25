# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi


# Autostart Hyprland on TTY1
if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
    export XDG_SESSION_TYPE=wayland
    export XDG_SESSION_DESKTOP=Hyprland
    export XDG_CURRENT_DESKTOP=Hyprland
    exec Hyprland
fi

# User specific environment and startup programs

export PATH=$PATH:/home/bi/.spicetify


# Added by Antigravity CLI installer
export PATH="/home/bi/.local/bin:$PATH"
