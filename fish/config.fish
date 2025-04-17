if status is-interactive
    # Commands to run in interactive sessions can go here
end

# ENV Variables
export ZYPP_MEDIANETWORK=1
set -x CPATH /usr/include/libinput /usr/include/wayland /usr/include/libxkbcommon

# set -x THEFUCK_OVERRIDDEN_ALIASES 'gsed,git'

# Starship
starship init fish | source

fish_add_path /home/michael/.spicetify
