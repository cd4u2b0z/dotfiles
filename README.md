# 🌲 Cdubz's Arch Linux + Hyprland Dotfiles

Dynamic, themeable Arch Linux rice with Hyprland and modern CLI tools.

## 📑 Table of Contents
- [What's Included](#-whats-included)
- [Deploy on New Machine](#-deploy-on-new-machine)
  - [CachyOS (Hyprland Edition)](#cachyos-hyprland-edition)
- [Chezmoi Workflow](#-chezmoi-workflow)
- [Wallust Theming](#-wallust-theming)
- [Key Bindings](#-key-bindings)
- [Structure](#-structure)
- [Troubleshooting](#-troubleshooting)

---

## 🎯 What's Included

| Category | Components |
|----------|------------|
| **WM** | Hyprland (Wayland) |
| **Terminal** | Kitty + Zsh + Starship |
| **Bar** | Waybar |
| **Launcher** | Fuzzel |
| **Notifications** | Mako |
| **Theming** | Wallust (dynamic) |
| **CLI Tools** | fzf, fd, bat, eza, zoxide, ripgrep |

---

## 🚀 Deploy on New Machine

### 1. Install Prerequisites
```bash
# Base packages
sudo pacman -S git chezmoi zsh

# Install an AUR helper (pick one)
# Option A: paru
git clone https://aur.archlinux.org/paru.git
cd paru && makepkg -si

# Option B: yay
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si
```

### 2. Apply Dotfiles
```bash
chezmoi init cd4u2b0z/dotfiles --apply
```

### 3. Install Packages
```bash
# Desktop (use paru or yay)
paru -S hyprland waybar kitty mako fuzzel thunar

# CLI tools
paru -S fzf fd bat eza zoxide ripgrep starship

# Apps
paru -S ncspot fastfetch btop cava

# Fonts
paru -S ttf-jetbrains-mono-nerd ttf-inter

# Theming
paru -S wallust
```

> **Note**: Replace `paru` with `yay` if you installed yay instead.

### 4. Post-Setup
```bash
# Set zsh as default
chsh -s $(which zsh)

# Enable update timer
systemctl --user daemon-reload
systemctl --user enable --now update-cache.timer

# Apply theme
wallust theme Everforest-Dark-Medium
source ~/.zshrc
```

### CachyOS (Hyprland Edition)

CachyOS uses systemd just like Arch, so everything works the same. Many packages come pre-installed:

```bash
# 1. Install chezmoi and apply
sudo pacman -S chezmoi
chezmoi init cd4u2b0z/dotfiles --apply

# 2. Install what's missing (--needed skips existing)
paru -S --needed zsh starship fzf fd bat eza zoxide ripgrep
paru -S --needed wallust ncspot fastfetch

# 3. Fonts (if not installed)
paru -S --needed ttf-jetbrains-mono-nerd ttf-inter

# 4. Set zsh as default
chsh -s $(which zsh)

# 5. Enable update timer (for Waybar updates module)
systemctl --user daemon-reload
systemctl --user enable --now update-cache.timer

# 6. Apply theme
wallust theme Everforest-Dark-Medium
source ~/.zshrc
```

> **Note**: CachyOS may have its own update notification. You can skip step 5 if you prefer using that instead.

---

## 🔄 Chezmoi Workflow

### After Making Changes
```bash
# Update single file
chezmoi re-add ~/.zshrc

# Update multiple files
chezmoi re-add ~/.config/hypr/hyprland.conf ~/.config/waybar/style.css

# Add new file to tracking
chezmoi add ~/.config/newapp/config

# Commit and push
chezmoi cd && git add -A && git commit -m "description" && git push
```

### Quick One-Liner
```bash
chezmoi re-add ~/.zshrc && chezmoi cd && git add -A && git commit -m "update zshrc" && git push
```

### On Another Machine
```bash
chezmoi update
```

### Useful Commands
```bash
chezmoi status          # See what's changed
chezmoi diff            # Show all differences
chezmoi diff ~/.zshrc   # Diff single file
chezmoi verify          # Check all files match
chezmoi forget <file>   # Stop tracking file
chezmoi merge <file>    # Interactive merge conflicts
```

---

## 🎨 Wallust Theming

Switch themes instantly - entire system updates:
```bash
wallust theme Everforest-Dark-Medium
wallust theme Nord
wallust theme Catppuccin-Mocha
wallust theme Dracula
wallust theme list                # List all themes
wallust run /path/to/image.jpg   # Generate from wallpaper
```

**Apps that auto-update:** Kitty, Waybar, Fuzzel, Mako, Hyprland, fzf, ncspot, Starship, tmux, Neovim

### Manual Reload (if needed)
```bash
source ~/.zshrc         # Reload fzf colors
pkill -USR2 waybar      # Reload waybar
makoctl reload          # Reload mako
```

---

## ⌨️ Key Bindings

> `Super` = Windows/Meta key

### Essential
| Key | Action |
|-----|--------|
| `Super + Return` | Terminal (Kitty) |
| `Super + T` | Terminal (alternative) |
| `Super + Q` | Close window |
| `Super + M` | Exit Hyprland |
| `Super + R` | App launcher (Fuzzel) |
| `Super + E` | File manager (Thunar) |
| `Super + V` | Toggle floating |
| `Super + F` | Maximize window |
| `Super + Shift + F` | True fullscreen |

### Applications
| Key | Action |
|-----|--------|
| `Super + B` | Firefox |
| `Super + Shift + B` | Brave |
| `Super + Alt + B` | Brave (alternative) |
| `Super + C` | VS Code |
| `Super + Shift + C` | btop (system monitor) |
| `Super + G` | Steam |
| `Super + Shift + G` | Lutris |
| `Super + .` | fastfetch |
| `Super + ,` | btop |

### Window Navigation
| Key | Action |
|-----|--------|
| `Super + Arrow keys` | Move focus |
| `Super + H/J/K/L` | Move focus (vim-style) |
| `Super + Shift + Arrow` | Move window |
| `Super + Shift + H/J/K/L` | Move window (vim-style) |
| `Super + Ctrl + Arrow` | Resize window |
| `Super + Ctrl + H/J/K/L` | Resize window (vim-style) |
| `Super + U` | Center floating window |

### Workspaces
| Key | Action |
|-----|--------|
| `Super + 1-9` | Switch to workspace |
| `Super + Shift + 1-9` | Move window to workspace |
| `Super + Tab` | Next workspace |
| `Super + Shift + Tab` | Previous workspace |
| `Super + S` | Toggle scratchpad |
| `Super + `` ` | Toggle games workspace |
| `F12` | Dropdown terminal |

### Screenshots
| Key | Action |
|-----|--------|
| `Print` | Fullscreen screenshot |
| `Super + Print` | Area selection |
| `Super + Shift + Print` | Window screenshot |
| `Ctrl + Print` | Fullscreen to clipboard |
| `Super + Shift + S` | Area to file (grim+slurp) |

### Volume & Media
| Key | Action |
|-----|--------|
| `XF86Audio RaiseVolume` | Volume up |
| `XF86Audio LowerVolume` | Volume down |
| `XF86Audio Mute` | Toggle mute |
| `Super + =/-` | Volume up/down |
| `Super + 0` | Toggle mute |
| `XF86Audio Play/Pause` | Play/pause media |
| `XF86Audio Next/Prev` | Next/previous track |

### Transparency
| Key | Action |
|-----|--------|
| `Ctrl + =` | Increase opacity |
| `Ctrl + -` | Decrease opacity |
| `Super + Shift + T` | Toggle transparency |

### Wallpaper & Themes
| Key | Action |
|-----|--------|
| `Super + W` | Theme switcher menu |
| `Super + Shift + W` | Quick wallpaper picker |
| `Super + Alt + W` | Next wallpaper (slideshow) |
| `Super + Ctrl + W` | Wallpaper status |

### System
| Key | Action |
|-----|--------|
| `Super + Ctrl + L` | Lock screen |
| `Super + Ctrl + S` | Sleep |
| `Super + Ctrl + H` | Hibernate |
| `Super + Ctrl + D` | Display off |
| `Super + Ctrl + P` | Power status |
| `Super + Ctrl + Shift + S` | Shutdown |
| `Super + Ctrl + Shift + R` | Reboot |
| `Super + Shift + Q` | Exit Hyprland |
| `Ctrl + Alt + Delete` | Exit Hyprland |

### Reload
| Key | Action |
|-----|--------|
| `Super + Shift + R` | Reload Hyprland |
| `Super + Alt + R` | Restart Waybar |

### Mouse
| Action | Binding |
|--------|---------|
| `Super + Left Click` | Move window |
| `Super + Right Click` | Resize window |

### FZF (Terminal)
| Key | Action |
|-----|--------|
| `Ctrl + T` | Fuzzy find files |
| `Ctrl + G` | Fuzzy cd into directory |
| `Ctrl + R` | Fuzzy command history |
| `**<Tab>` | Trigger fzf completion |

### Zoxide (Terminal)
```bash
z proj          # Jump to ~/Projects
z dot conf      # Jump to dir matching both words
zi              # Interactive picker with fzf
```

---

## 📁 Structure

```
~/.config/
├── hypr/           # Hyprland WM config
├── kitty/          # Terminal
├── waybar/         # Bar + scripts
├── wallust/        # Theme engine
│   ├── templates/  # Color templates
│   └── scripts/    # Post-theme hooks
├── mako/           # Notifications
├── fuzzel/         # Launcher
├── nvim/           # Neovim config
└── starship.toml   # Prompt

~/.local/bin/       # Custom scripts
~/.cache/wallust/   # Generated colors
```

---

## 🆘 Troubleshooting

| Problem | Solution |
|---------|----------|
| fzf colors not updating | `source ~/.zshrc` |
| Waybar not showing updates | `systemctl --user start update-cache.service` |
| ncspot theme stuck | `~/.config/wallust/scripts/update-ncspot-theme.sh` then restart |
| Chezmoi conflicts | `chezmoi diff <file>` then `chezmoi re-add <file>` |

---

## 🖼️ System

- **Resolution**: 3840x2160 (4K @ 1.33x scale)
- **GPU**: NVIDIA RTX 3090
- **Current Theme**: Everforest-Dark-Medium

---

*Managed with chezmoi • Themed with wallust* 🌲

**— Dr. Baklava**
