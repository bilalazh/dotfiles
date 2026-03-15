if status is-interactive

alias gemini 'env NODE_OPTIONS="--dns-result-order=ipv4first" command gemini'
alias vivaldi 'vivaldi --ozone-platform=x11'
alias vivaldi-browser 'vivaldi --ozone-platform=x11'
alias zen '/home/bi/.local/bin/zen'
alias obsidian 'obsidian &'
alias wall 'pkill swaybg; swaybg -i (find /home/bi/dotfiles/.config/hypr/images/ -type f | shuf -n 1) -m fill &'



# this uses cliphist to get the results that were pasted without using third party app
# todo: can also try to oepn it in a dedicated floating always on top terminal like i do with nmtui
function clf
    cliphist list | fzf -d '\t' --with-nth 2 | cliphist decode | wl-copy
end


# Hide the fish greeting
 set -g fish_greeting


function cw
    cliphist wipe
    # Optional:
     notify-send "Clipboard Cleared"
     # uncomment if you want a desktop notification
 end

function cll
    cliphist list | cut -f2- | head -n 50
end


	# Commands to run in interactive sessions can go here
end

# Start Hyprland automatically on tty1
if status is-login
    if test (tty) = /dev/tty1
        exec Hyprland
    end
end
