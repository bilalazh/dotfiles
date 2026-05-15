if status is-interactive

alias gemini 'env NODE_OPTIONS="--dns-result-order=ipv4first" command gemini'
alias vivaldi 'vivaldi --ozone-platform=x11'
alias vivaldi-browser 'vivaldi --ozone-platform=x11'
alias zen '/home/bi/.local/bin/zen'
alias obsidian 'obsidian &'
alias aioun '/home/bi/.local/share/AionUi/AionUi'
# alias wall 'pkill swaybg; swaybg -i (find /home/bi/dotfiles/.config/hypr/images/ -type f | shuf -n 1) -m fill &' # Commented: use wp function instead



# this uses cliphist to get the results that were pasted without using third party app
# todo: can also try to oepn it in a dedicated floating always on top terminal like i do with nmtui
function clf
    cliphist list | fzf -d '\t' --with-nth 2 | cliphist decode | wl-copy
end


# Hide the fish greeting
set -g fish_greeting

# Add user local bin to PATH
set -gx PATH $PATH ~/.local/bin


function cw
    cliphist wipe
    # Optional:
     notify-send "Clipboard Cleared"
     # uncomment if you want a desktop notification
 end

function cll
    cliphist list | cut -f2- | head -n 50
end


function setbg
    # 1. Set your wallpaper directory (change this to your actual path)
    set dir /home/bi/dotfiles/.config/hypr/images

    # 2. Use fzf to pick a file
    set img (ls $dir | fzf --preview "echo {}" --header="Select Painting")

    # 3. If you actually picked something (didn't hit ESC)
    if test -n "$img"
        # Kill the old swaybg so it doesn't waste RAM
        pkill swaybg

        # Start swaybg in the background with nohup so it survives terminal close
        nohup swaybg -i $dir/$img -m fill >/dev/null 2>&1 &

        # Optional: Print a clean message
        echo "Setting wallpaper: $img"

        # Notification
        notify-send "Wallpaper was Set"
    end
end


	# Commands to run in interactive sessions can go here
end

# Start Hyprland automatically on tty1
if status is-login
    if test (tty) = /dev/tty1
        exec start-hyprland
    end
end
