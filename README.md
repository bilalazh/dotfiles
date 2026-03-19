

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

- [ ] MPRIS/Now Playing Research - Look into what features people add to their MPRIS modules (album art display, progress bar, shuffle/repeat controls, volume control, queue management). Figure out what would be most useful for personal use case (quick controls, visual feedback, etc.)
- [ ] Pulseaudio/Audio Module Color - Research better Gruvbox colors for the pulseaudio module (muted state needs better contrast, explore other color options that work well with the current theme)
- [ ] Pulseaudio Interactions Research - Explore what custom interactions can be added beyond scrolling (e.g., middle click to launch mixer, right click for sink selection, double-click for pavucontrol, scripts for quick sink switching, custom icons for different audio states, volume presets, mute toggles with visual feedback)
- [ ] Clock/Date Module Customization - Research clock interactions (click to toggle format, right-click for calendar, scroll months, timezone switch, weather integration, system stats display)
- [ ] Custom Waybar Modules - Research and add these modules:
    - Power/CPU (autocpufreq) - Show governor mode (powersave/performance/turbo), click to toggle, show CPU frequency
    - TLP status - Show if active, power saving mode indicator
    - System monitor - CPU%, RAM, GPU temp, battery drain/charge rate
    - Bluetooth toggle - Quick on/off with status
    - Night light toggle - Warm light toggle
    - Screenshot - Quick screenshot button (grim/maim)
    - Clipboard - Show clipboard count or quick access
    - VPN status - Show connected/disconnected state
    - Microphone toggle - Mute/unmute with visual indicator
    - Keyboard layout - Show current layout (EN/AR)
    - Weather - Current temp via script
    - Disk usage - Show free space
- [ ] TLP Config Backup - Research how to backup/restore TLP config (located at /etc/default/tlp or /etc/tlp.conf, needs root) - Add manual setup instructions to dotfiles

### Advanced Waybar Research (from internet)
- [ ] Waycat - Animated waybar modules (https://github.com/CarloCattaneo/waycat)
- [ ] Waybar Groups Module - Show Hyprland grouped window titles (Rust, https://github.com/aegroto/waybar-groupie)
- [ ] GitHub Weekly Commits Widget - Heatmap of weekly GitHub contributions (Python, https://github.com/ad1822/weekly-github-waybar-module)
- [ ] Waybar AMD Module - AMD GPU/CPU metrics (power, temp, frequency, utilization) (Go, https://github.com/bnema/waybar-amd-module)
- [ ] Waybar Sysinfo Plugin - System info as vertical bars (Rust, https://github.com/acidnik/waybar-sysinfo)
- [ ] Waybar Sparklines - CPU/Memory sparkline support (Rust, https://github.com/LawnGnome/waybar-custom-modules)
- [ ] Pomodoro Timers for Waybar - Multiple options:
    - Tomat - New pomodoro timer for status bars
    - waybar-timer - Simple customizable timer with scroll controls (Rust, https://github.com/jbirnick/waybar-timer)
    - waybar-pomodoro-timer - Pomodoro with notifications/sound (Shell, https://github.com/niraletter/waybar-timer)
    - pomobar - C-based pomodoro (https://github.com/mt190502/pomobar)
    - waybar-module-pomodoro - Rust pomodoro (https://github.com/Andeskjerf/waybar-module-pomodoro)
- [ ] Weather Module - Build with wttr.in or OpenWeatherMap API (see https://travis.media/blog/custom-weather-module-waybar/)
- [ ] Window Count Module - Show count of windows in current workspace (merged into waybar, https://github.com/Alexays/Waybar/pull/3544)
- [ ] Keyboard Layout Indicator - Show caps/num lock status (user needs 'input' group) 