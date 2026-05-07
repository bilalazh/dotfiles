# Terminal Window Class/App-ID Reference

When setting up window rules in Hyprland or Waybar, different terminals use different flags to set their window class/app-id.

## Comparison Table

| Terminal | Flag | Example Command |
|----------|------|------------------|
| **foot** | `--app-id` | `foot --app-id my-class -e nmtui` |
| **kitty** | `--class` | `kitty --class my-class -e nmtui` |
| **alacritty** | `--class` | `alacritty --class my-class -e nmtui` |
| **wezterm** | `--class` | `wezterm start --class my-class -- nmtui` |
| **gnome-terminal** | (uses title) | N/A (not recommended) |
| **konsole** | (uses profile) | N/A (not recommended) |

## How to Check

### 1. Find the window class of a running terminal

```bash
hyprctl clients | grep -i <keyword>
```

Example output:
```
Window 561c55ee75e0 -> nmtui:
	class: nmtui-float
	initialClass: nmtui-float
```

### 2. Check running process

```bash
ps aux | grep -E "foot|kitty" | grep -v grep
```

### 3. Test flags for each terminal

For **foot**:
```bash
foot --app-id my-class -e echo "hello"
```

For **kitty**:
```bash
kitty --class my-class -e echo "hello"
```

## Hyprland Window Rules

Use `match:class` to match the window:

```hypr
# Float nmtui windows
windowrule = float on, match:class ^(nmtui-float)$
windowrule = center on, match:class ^(nmtui-float)$
windowrule = size 600 400, match:class ^(nmtui-float)$
```

## Common Mistakes

- Using `--class` with foot → should be `--app-id`
- Using `--app-id` with kitty → should be `--class`
- Forgetting regex anchors `^(...)$` for exact match

## Useful Commands

```bash
# Reload Hyprland config
hyprctl reload

# Restart waybar
killall waybar && waybar &

# Check current window rules
hyprctl namedbindings
```