# 🖥️ CLI Tools & Dotfiles Cheat Sheet
> craig's Arch Linux + Hyprland setup

---

## 📁 FZF (Fuzzy Finder)

### Keybindings
| Key | Action |
|-----|--------|
| `Ctrl+T` | Fuzzy search files, insert path at cursor |
| `Ctrl+G` | Fuzzy cd into directory (custom binding) |
| `Ctrl+R` | Fuzzy search command history |
| `**<Tab>` | Trigger fzf completion (e.g., `vim **<Tab>`) |

### Usage Examples
```bash
vim <Ctrl+T>              # Find file, open in vim
cd **<Tab>                # Fuzzy cd
cat src/**<Tab>           # Search only in src/
kill <Tab>                # Fuzzy select process to kill
ssh **<Tab>               # Fuzzy select host
```

### Tips
- Type multiple words to narrow: `config zsh` matches `.zshrc`
- Use `!` to exclude: `!test` excludes files with "test"
- Use `^` for prefix: `^src` starts with "src"
- Use `$` for suffix: `.sh$` ends with ".sh"

---

## 🚀 Zoxide (Smart cd)

### Commands
| Command | Action |
|---------|--------|
| `z <partial>` | Jump to best-matching directory |
| `z foo bar` | Jump to dir matching "foo" AND "bar" |
| `zi` | Interactive selection with fzf |
| `z -` | Go to previous directory |

### Examples
```bash
z proj          # → ~/Projects (if visited often)
z dot conf      # → ~/.config/dotfiles
zi              # Interactive picker
```

### How It Learns
- Tracks every `cd` you do
- Uses "frecency" (frequency + recency)
- More visits + recent = higher score

---

## 🔍 fd (Modern find)

### Basic Usage
```bash
fd pattern              # Search filenames
fd -e sh                # Find all .sh files
fd -t d                 # Directories only
fd -t f                 # Files only
fd -H                   # Include hidden files
fd -I                   # Include ignored files (.gitignore)
fd pattern /path        # Search in specific path
```

### Examples
```bash
fd config               # All files with "config" in name
fd -e py -x chmod +x    # Find .py files, make executable
fd -t d node_modules    # Find all node_modules dirs
fd . -e jpg | wc -l     # Count all jpg files
```

---

## 🎨 Wallust (Theme Management)

### Commands
```bash
wallust theme <name>              # Apply built-in theme
wallust theme Everforest-Dark-Medium
wallust theme Nord
wallust theme Catppuccin-Mocha
wallust theme list                # List all themes

wallust run /path/to/image.jpg    # Generate theme from image
```

### After Theme Switch
The following update automatically:
- ✅ Kitty terminal
- ✅ Waybar
- ✅ Fuzzel
- ✅ Mako notifications
- ✅ Hyprland colors
- ✅ fzf colors
- ✅ ncspot (restart needed)
- ✅ Starship prompt
- ✅ tmux

### Manual Reload (if needed)
```bash
source ~/.zshrc         # Reload fzf colors
pkill -USR2 waybar      # Reload waybar
makoctl reload          # Reload mako
```

---

## 📦 Update Cache Timer

A systemd timer refreshes package update counts every hour.

### Commands
```bash
# Check timer status
systemctl --user status update-cache.timer
systemctl --user list-timers

# Manual refresh
systemctl --user start update-cache.service

# Disable/Enable
systemctl --user disable update-cache.timer
systemctl --user enable update-cache.timer
```

### Files
- `~/.config/systemd/user/update-cache.timer`
- `~/.config/systemd/user/update-cache.service`
- `~/.config/waybar/scripts/refresh-update-cache.sh`

---

## 🎵 ncspot (Spotify TUI)

### Keybindings
| Key | Action |
|-----|--------|
| `Space` | Play/Pause |
| `>` / `<` | Next/Previous track |
| `s` | Toggle shuffle |
| `r` | Toggle repeat |
| `+` / `-` | Volume up/down |
| `/` | Search |
| `q` | Quit |
| `?` | Help |

### Navigation (vim-style)
| Key | Action |
|-----|--------|
| `j/k` | Down/Up |
| `h/l` | Left/Right |
| `g/G` | Top/Bottom |

---

## 🧰 Chezmoi (Dotfiles Manager)

### Daily Workflow

#### After Making Changes
```bash
# See what changed
chezmoi status

# Update single file
chezmoi re-add ~/.zshrc

# Update multiple files
chezmoi re-add ~/.config/hypr/hyprland.conf ~/.config/waybar/style.css

# Add new file
chezmoi add ~/.config/newapp/config

# Commit and push
chezmoi cd
git add -A
git commit -m "Description of changes"
git push
```

#### Quick One-Liner
```bash
chezmoi re-add ~/.zshrc && chezmoi cd && git add -A && git commit -m "update zshrc" && git push
```

### View Differences
```bash
chezmoi diff                      # All differences
chezmoi diff ~/.zshrc             # Single file
chezmoi forget ~/.config/app      # Stop tracking
```

---

## 🆕 Deploy on a New PC

### 1. Install Base Packages
```bash
# Arch Linux
sudo pacman -S git chezmoi zsh fzf fd bat eza zoxide

# Install paru (AUR helper)
git clone https://aur.archlinux.org/paru.git
cd paru && makepkg -si
```

### 2. Initialize Chezmoi
```bash
chezmoi init cd4u2b0z/dotfiles --apply
```

This will:
- Clone your dotfiles repo
- Apply all configs to the new machine

### 3. Post-Setup

#### Enable systemd timers
```bash
systemctl --user daemon-reload
systemctl --user enable --now update-cache.timer
```

#### Set zsh as default shell
```bash
chsh -s $(which zsh)
```

#### Generate wallust colors
```bash
wallust theme Everforest-Dark-Medium
source ~/.zshrc
```

#### Install additional packages
```bash
# Core apps
paru -S hyprland waybar kitty mako fuzzel

# Extras
paru -S ncspot spotify-launcher fastfetch starship

# Fonts
paru -S ttf-jetbrains-mono-nerd ttf-inter
```

### 4. Verify
```bash
chezmoi verify    # Check all files match
fastfetch         # Should show your themed setup
```

---

## 🔄 Sync Between Machines

### On Machine A (after changes)
```bash
chezmoi re-add <changed-files>
chezmoi cd && git add -A && git commit -m "update" && git push
```

### On Machine B (to pull changes)
```bash
chezmoi update
```

---

## 📋 Quick Reference

### File Locations
| What | Where |
|------|-------|
| Chezmoi source | `~/.local/share/chezmoi/` |
| Chezmoi config | `~/.config/chezmoi/` |
| Wallust config | `~/.config/wallust/wallust.toml` |
| Wallust templates | `~/.config/wallust/templates/` |
| Generated colors | `~/.cache/wallust/` |
| Hyprland config | `~/.config/hypr/hyprland.conf` |
| Waybar config | `~/.config/waybar/config` |
| zsh config | `~/.zshrc` |

### Useful Aliases (from your zshrc)
```bash
fh          # Fuzzy history search
ffile       # Fuzzy file open
ftldr       # Fuzzy tldr search
z <dir>     # Smart cd
```

---

## 🆘 Troubleshooting

### fzf colors not updating
```bash
source ~/.zshrc
# Or check if file exists:
cat ~/.cache/wallust/fzf-colors.sh
```

### Waybar not showing updates
```bash
systemctl --user start update-cache.service
pkill -SIGRTMIN+8 waybar
```

### ncspot theme not changing
```bash
~/.config/wallust/scripts/update-ncspot-theme.sh
# Then restart ncspot
```

### Chezmoi conflicts
```bash
chezmoi diff <file>           # See differences
chezmoi merge <file>          # Interactive merge
chezmoi re-add <file>         # Overwrite source with current
```

---

*Last updated: January 14, 2026*
