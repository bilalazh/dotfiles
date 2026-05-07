# Hyprland Window Rules - Complete Guide (For Humans)

## What Are Window Rules?

Window rules tell Hyprland **"when you see a window that looks like X, do Y to it"**.

Think of it like automatic sorting rules for your windows:
- "When Spotify opens, put it on workspace 10"
- "When nmtui opens, make it float and center it"
- "When any app tries to maximize, ignore it"

Without window rules, every app opens wherever it wants. With rules, you control where things go.

---

## BEFORE YOU START: Find Your Window's Info

Before writing any rule, you need to know how Hyprland sees the window.

### Step 1: Open the app you want to control

### Step 2: Open a terminal and run:
```bash
hyprctl clients
```

### Step 3: Look for output like this:
```
Window 12345678 -> YouTube Music:
    class: "YouTube Music"
    title: "YouTube Music"
    initialClass: "YouTube Music"
    initialTitle: "YouTube Music"
```

### What These Mean:
- **class** = The app's internal name (use `match:class`)
- **title** = The text in the title bar (changes often, use `match:title`)
- **initialClass** = The class when the window FIRST opened (use `match:initial_class`)
- **initialTitle** = The title when the window FIRST opened (use `match:initial_title`)

### Which One Should You Use?
- **Use `initial_title`** for web apps (YouTube Music, Discord, etc.) - their titles change when you navigate
- **Use `class`** for native apps (kitty, firefox, steam) - their class name stays the same

**Pro tip:** `initial_title` and `initial_class` are safer because they never change after the window opens.

---

## The New Syntax (0.54+) - How to Read a Rule

Every window rule follows this pattern:

```
windowrule = EFFECT, match:PROP PATTERN
```

**Break it down:**
1. `windowrule = ` - Always starts like this
2. `EFFECT` - What to DO (float, workspace, size, etc.)
3. `, match:` - Comma, then the word "match:"
4. `PROP` - What to CHECK (class, title, etc.)
5. `PATTERN` - What to LOOK FOR (Spotify, kitty, etc.)

**In plain English:** "Apply this effect, but ONLY if the window matches this condition"

### Example Walkthrough:

```
windowrule = workspace 10, match:initial_title ^(Spotify.*)$
```

| Part | Meaning |
|------|---------|
| `windowrule = ` | I'm writing a window rule |
| `workspace 10` | Put the window on workspace 10 |
| `, ` | Now comes the condition |
| `match:initial_title` | Check the window's original title |
| `^(Spotify.*)$` | Match if it starts with "Spotify" |

**Full sentence:** "Put this window on workspace 10, but ONLY if its original title starts with Spotify"

---

## PART 1: Match Props (The "IF" Conditions)

These tell Hyprland WHAT to look for. You MUST use at least one.

### Most Common Props

| Prop | What it checks | When to use it |
|------|---------------|----------------|
| `match:initial_title` | The title when window first opened | Web apps, PWAs, anything that changes title |
| `match:class` | The app's internal class name | Native apps, terminals, browsers |
| `match:initial_class` | The class when window first opened | Same as class, but won't change |
| `match:title` | The current title right now | Rarely needed, changes too often |

### Less Common Props (for advanced matching)

| Prop | What it checks | Example |
|------|---------------|---------|
| `match:xwayland 1` | Is this an XWayland (old Linux) app? | `match:xwayland 1` |
| `match:float 1` | Is the window floating? | `match:float 1` means yes, `match:float 0` means no |
| `match:fullscreen 1` | Is it fullscreen? | `match:fullscreen 1` |
| `match:pin 1` | Is it pinned to all workspaces? | `match:pin 1` |
| `match:modal 1` | Is it a popup dialog? | `match:modal 1` |
| `match:workspace 5` | Is it on workspace 5? | `match:workspace 5` |
| `match:focus 1` | Is it currently focused? | `match:focus 1` |

**Note:** For boolean props (yes/no), use `1` for yes/true and `0` for no/false.

---

## PART 2: Effects (The "THEN" Actions)

These tell Hyprland WHAT to do to the window.

### Workspace and Monitor

| Effect | What it does | Example |
|--------|-------------|---------|
| `workspace N` | Move to workspace N | `workspace 10` |
| `workspace NAME` | Move to named workspace | `workspace music` |
| `monitor NAME` | Move to specific monitor | `monitor DP-1` |
| `monitor ID` | Move to monitor by number | `monitor 1` |

### Window State (Floating vs Tiled)

| Effect | What it does | When to use it |
|--------|-------------|----------------|
| `float on` | Make window float (can drag around) | Small dialogs, settings windows, calculators |
| `tile on` | Force window to be tiled (in grid) | Web apps that open floating by default |
| `fullscreen on` | Make fullscreen | Video players, games |
| `maximize on` | Maximize window | Rarely needed |
| `pseudo on` | Pseudo-tile (big tile with gaps) | When you want a tile but with spacing |

### Position and Size

| Effect | What it does | Example |
|--------|-------------|---------|
| `center on` | Center floating window on screen | Use with float |
| `size W H` | Set exact width and height | `size 800 600` |
| `move X Y` | Move to exact position | `move 100 200` |

### Behavior

| Effect | What it does | When to use it |
|--------|-------------|----------------|
| `no_focus on` | Don't focus this window | Background notifications, tooltips |
| `pin on` | Show on ALL workspaces | Music player you want always visible |
| `no_initial_focus on` | Don't auto-focus when opened | Background apps |
| `stay_focused on` | Don't let other windows steal focus | Games, fullscreen videos |
| `suppress_event maximize` | Ignore maximize button | Prevent apps from forcing fullscreen |

### Visual (The Cool Stuff)

| Effect | What it does | When to use it |
|--------|-------------|----------------|
| `opacity 0.8` | Make window see-through (0.0 = invisible, 1.0 = solid) | Terminal backgrounds, cool effects |
| `border_size 0` | Remove border completely | Minimal setups |
| `rounding 10` | Round corners by N pixels | Modern look |
| `no_shadow on` | Remove drop shadow | Clean minimal look |
| `no_anim on` | Disable animations for this window | Fast switching |

### Advanced Power-User Stuff

| Effect | What it does | When to use it |
|--------|-------------|----------------|
| `animation STYLE` | Custom open/close animation | `animation popin`, `animation slide` |
| `idle_inhibit always` | Prevent screen from sleeping | Watching videos, playing games |
| `content game` | Tell Hyprland this is a game | Better performance handling |
| `dim_around on` | Darken everything behind this window | Modal dialogs |
| `decorate on` / `decorate off` | Show/hide window decorations | Custom looks |

---

## PART 3: Pattern Matching (Regex) - Explained Simply

You need to tell Hyprland EXACTLY which window to match. There are three ways:

### Method 1: Exact Match (Simplest)

Just write the name exactly:
```
match:class kitty
match:initial_title YouTube Music
```

**When to use:** The name never changes and has no spaces or special characters.

### Method 2: Pattern Match (Regex)

Use special characters to match flexible patterns:

| Symbol | What it means | Real Example |
|--------|-------------|-------------|
| `.` | Any ONE character | `c.t` matches cat, cut, cot |
| `.*` | Any characters (or nothing) | `Spotify.*` matches Spotify, Spotify Premium, Spotify - My Playlist |
| `^` | Start of the name | `^kitty` matches "kitty" but NOT "mykitty" |
| `$` | End of the name | `kitty$` matches "kitty" but NOT "kitty2" |
| `()` | Group things together | `^(Spotify.*)$` means "the whole thing starts with Spotify" |
| `\|` | OR (this OR that) | `^(firefox\|chromium)$` matches firefox OR chromium |

### Common Patterns You Can Copy:

```
# Match exact name, nothing before or after
match:class ^(kitty)$

# Match if it STARTS with something
match:initial_title ^Spotify

# Match if it ENDS with something
match:title .*\.mp4$

# Match if it CONTAINS something anywhere
match:title .*YouTube.*

# Match multiple apps at once
match:class ^(firefox|chromium|brave)$

# Match EVERYTHING (all windows)
match:class .*

# Match a web app that might have different titles
match:initial_title ^(YouTube Music.*)$
```

### Method 3: Negative Match (Match everything EXCEPT)

```
# Affect all windows EXCEPT kitty
match:class negative:kitty

# Match all initial titles EXCEPT Spotify
match:initial_title negative:Spotify
```

---

## PART 4: Combining Multiple Conditions (AND Logic)

You can use multiple `match:` props. **ALL must match** for the effect to happen.

```
# Only affect windows that are BOTH floating AND on XWayland
windowrule = center on, match:xwayland 1, match:float 1

# Only affect Firefox when it's on workspace 3
windowrule = opacity 0.5, match:class firefox, match:workspace 3

# Only affect focused floating windows
windowrule = border_color rgb(FF0000), match:focus 1, match:float 1
```

**Think:** "Match this AND this AND this..."

---

## PART 5: Static vs Dynamic Effects

Some effects happen once, some keep updating.

### Static Effects (Happens Once When Window Opens)

These are SET and FORGET:
- `float`, `tile`, `workspace`, `size`, `move`, `monitor`

Example: If you set `workspace 10`, the window goes there when it opens. If you later move it to workspace 5, the rule won't force it back.

### Dynamic Effects (Keeps Updating)

These change automatically when conditions change:
- `opacity`, `border_color`, `animation`, `dim_around`

Example:
```
# Make floating windows have red borders
windowrule = border_color rgb(FF0000), match:float 1
```
When you float a window → border turns red. When you tile it → border goes back to normal.

---

## PART 6: Named Rules (Grouping Multiple Effects)

Instead of writing 3 separate rules for one window, group them:

```
windowrule {
  name = my-floating-apps
  match:class = ^(nmtui-float|cliphist-float)$
  float = on
  center = on
  size = 600 400
}
```

**Why use this?**
- Cleaner config
- Named rules take PRIORITY over one-line rules
- You can disable them later: `hyprctl keyword 'windowrule[my-floating-apps]:enable false'`

---

## PART 7: Tags (The Really Cool Feature)

Tags let you label windows and apply rules to tagged windows.

### How to Use Tags:

**Step 1:** Tag a window with a keybind:
```
bind = $mainMod, T, tagwindow, +music
```

**Step 2:** Apply rules to tagged windows:
```
# Make all "music" tagged windows have low opacity
windowrule = opacity 0.7, match:tag music

# Make "music" windows float
windowrule = float on, match:tag music
```

**Tags are dynamic** - you can add/remove them anytime!

---

## COOKBOOK: Copy-Paste Examples

### Recipe 1: Organize Workspaces
```
# Put apps where they belong
windowrule = workspace 1, match:initial_title ^(Firefox.*)$
windowrule = workspace 2, match:initial_title ^(Discord.*)$
windowrule = workspace 3, match:class ^(kitty)$
windowrule = workspace 10, match:initial_title ^(Spotify.*)$
```

### Recipe 2: Make Dialogs Float and Center
```
# All popup dialogs float and center
windowrule = float on, match:modal 1
windowrule = center on, match:modal 1
windowrule = size 800 600, match:modal 1
```

### Recipe 3: Picture-in-Picture Mode
```
# Make video popups float, stay on top, and be small
windowrule = float on, match:title .*Picture-in-Picture.*
windowrule = pin on, match:title .*Picture-in-Picture.*
windowrule = size 400 225, match:title .*Picture-in-Picture.*
windowrule = move 1500 50, match:title .*Picture-in-Picture.*
```

### Recipe 4: Gaming Setup
```
# Games get fullscreen, no sleep, stay focused
windowrule = fullscreen on, match:initial_title ^(GameName.*)$
windowrule = idle_inhibit always, match:initial_title ^(GameName.*)$
windowrule = stay_focused on, match:initial_title ^(GameName.*)$
windowrule = content game, match:initial_title ^(GameName.*)$
```

### Recipe 5: Minimal Terminal
```
# Terminal with no borders, rounded corners, slight transparency
windowrule = border_size 0, match:class kitty
windowrule = rounding 15, match:class kitty
windowrule = opacity 0.9, match:class kitty
```

### Recipe 6: Prevent Annoying Maximize
```
# Ignore maximize from ALL apps
windowrule = suppress_event maximize, match:class .*
```

### Recipe 7: Floating Apps with Style
```
# Calculator floats, centered, specific size
windowrule = float on, match:class ^(galculator|gnome-calculator)$
windowrule = center on, match:class ^(galculator|gnome-calculator)$
windowrule = size 300 400, match:class ^(galculator|gnome-calculator)$
windowrule = animation popin, match:class ^(galculator|gnome-calculator)$
```

---

## DEBUGGING: When Things Go Wrong

### Step 1: Check for Errors
```bash
hyprctl reload
```
Watch the output. It will tell you which line has a problem.

### Step 2: Verify Your Match
```bash
hyprctl clients
```
Make sure the class/title you're matching ACTUALLY exists.

### Step 3: Test Simple First
Don't write a complex rule. Start simple:
```
# Test with just class
windowrule = float on, match:class kitty
```
If that works, add more conditions.

### Step 4: Check Rule Order
Rules are read TOP TO BOTTOM. Later rules can override earlier ones.
```
# This sets opacity to 0.8
windowrule = opacity 0.8, match:class kitty

# This OVERRIDES it to 0.5 for floating kitty
windowrule = opacity 0.5, match:class kitty, match:float 1
```

### Common Errors:
- `invalid field type floating` → Use `match:float` not `match:floating`
- `invalid field type pinned` → Use `match:pin` not `match:pinned`
- `invalid field type fullscreen` → Use `match:fullscreen` not `match:fullscreen 1` (wait, actually `match:fullscreen 1` should work...)
- Rule not working? → Check `hyprctl clients` for exact spelling

---

## FULL EXAMPLE CONFIG

```
# === WINDOW RULES ===

# 1. BASIC BEHAVIOR
# Ignore all maximize requests
windowrule = suppress_event maximize, match:class .*

# XWayland windows with empty class/title (fix dragging issues)
windowrule = no_focus on, match:class ^$, match:title ^$, match:xwayland 1

# 2. WORKSPACE ORGANIZATION
# Web apps go to specific workspaces
windowrule = workspace 6, match:initial_title ^(Noeko.*)$
windowrule = workspace 7, match:initial_title ^(WhatsApp.*)$
windowrule = workspace 9, match:initial_title ^(Handy.*)$
windowrule = workspace 9, match:initial_title ^(Whispering.*)$
windowrule = workspace 10, match:initial_title ^(Spotify.*)$

# 3. MAKE PWAS TILED (not floating)
windowrule = tile on, match:initial_title ^Noeko.*$
windowrule = tile on, match:initial_title ^Grok.*$
windowrule = tile on, match:initial_title ^WhatsApp.*$
windowrule = tile on, match:initial_title ^Pintrest.*$
windowrule = tile on, match:initial_title ^Snapchat.*$
windowrule = tile on, match:initial_title ^Figma.*$
windowrule = tile on, match:initial_title ^YouTube Music.*$
windowrule = tile on, match:initial_title ^Discord.*$

# 4. FLOATING WINDOWS (with style)
# nmtui network manager
windowrule = float on, match:class ^(nmtui-float)$
windowrule = center on, match:class ^(nmtui-float)$
windowrule = size 600 400, match:class ^(nmtui-float)$

# cliphist history
windowrule = float on, match:class ^(cliphist-float)$
windowrule = center on, match:class ^(cliphist-float)$
windowrule = size 800 600, match:class ^(cliphist-float)$

# 5. COOL VISUAL EFFECTS
# Transparent terminal
windowrule = opacity 0.9, match:class kitty
windowrule = rounding 10, match:class kitty

# 6. GAMING
# Prevent screen sleep during games
windowrule = idle_inhibit always, match:content game
```

---

## QUICK REFERENCE CARD

**Template:**
```
windowrule = EFFECT, match:PROP PATTERN
```

**Common Props:**
- `match:class` - App's internal name
- `match:initial_title` - Title when opened (safest for web apps)
- `match:initial_class` - Class when opened (safest for native apps)
- `match:xwayland 1` - Old Linux apps
- `match:float 1` - Floating windows
- `match:modal 1` - Dialog popups

**Common Effects:**
- `workspace N` - Move to workspace
- `float on` / `tile on` - Floating or tiled
- `center on` - Center floating window
- `size W H` - Set size
- `opacity 0.8` - Transparency
- `pin on` - Show on all workspaces
- `suppress_event maximize` - Ignore maximize
- `idle_inhibit always` - Prevent sleep
- `border_size 0` - No border
- `rounding 10` - Round corners

**Regex Patterns:**
- `^Start` - Starts with "Start"
- `End$` - Ends with "End"
- `.*Anywhere.*` - Contains "Anywhere"
- `^(Exact)$` - Exact match
- `.*` - Everything
- `^(A|B)$` - A or B

---

*Remember: Start simple, test one rule at a time, use `hyprctl clients` to find exact names, and use `hyprctl reload` to check for errors.*
