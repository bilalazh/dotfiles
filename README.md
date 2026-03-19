

## Dotfiles

### tasks 

- modularize the files (This change is underway) 
- terminal emulator configs 
- login manager
- wofi config 


### Sofware to install 
- kanata (keybinds for main keyboard ) 
    - check some good references for it

### Fish Shell Functions (Cliphist)

- `clf` - Search cliphist with fzf and copy selected entry
- `cll` - Show last 50 clipboard history entries (cliphist list | cut -f2- | head -n 50)
- `cw` - Wipe cliphist and send notification

## TODOS:
- login stuff 
- Check if there is Sf Mono Nerd Font Available or not
(What is diff between the Sf Rounded  and non rounded ) 
- Making fonts sharper system wide 
- Better Cleaner icons and how to make them more reactive  
- Can you use OKLCH or other color spaces in GTK css or not ? 
- Check in AI studio what text shadow values and how can they save the transparent stuff 


- there is a weird aritifact where the currnet layer is being affected by the lightness and the darkness of the interfacew  and i am not sure what ot balme for this since this is showin here i can do research later if this is the cultprut hte edges around the fonts show a slight tint based on if they are shown in light or dark mode and this just does not look right visually at all  
    /* blur is handled by Hyprland: layerrule = blur, waybar */


<!-- this fixed the werid problem that i had related to layer blur  -->
- removed the hyprland blur and stoped it from targetting waybar specifically  

- Learn how  to deal with the margin and spaces between these elements 
- When wifi is not connected Something cool can be hardcoded there as icon or text  line 121 of config.json
- add interactions in the waybar configs using the terminal commands you can make all kinds of actions and scrolls and right and left swaps what ever you can imagine you can do that with this because you can run terminal commands and i think even scripts so sky isthe limtit here 