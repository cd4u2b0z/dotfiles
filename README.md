# 🌲 Craig's Arch Linux + Hyprland Setup

A dynamic, themeable Arch Linux rice with Hyprland, native 4K support, and modern CLI tools.

## 🎯 Overview

- **Speed**: Arch Linux with optimized Hyprland compositor
- **Beauty**: Dynamic theming via Wallust (not locked to any single theme)
- **Productivity**: Modern CLI tools and keyboard-driven workflow
- **Reliability**: Chezmoi dotfiles management

## 🖥️ Desktop Environment

| Component | Choice |
|-----------|--------|
| **WM** | Hyprland (Wayland) |
| **Terminal** | Kitty |
| **Shell** | Zsh + Starship prompt |
| **Bar** | Waybar |
| **Launcher** | Fuzzel |
| **Notifications** | Mako |
| **File Manager** | Thunar |

## 🎨 Dynamic Theming (Wallust)

**No longer locked to Nord~/.local/share/chezmoi/README.md 2>&1 | head -200* The entire system theme updates dynamically:

```bash
# Switch themes instantly
wallust theme Everforest-Dark-Medium
wallust theme Nord
wallust theme Catppuccin-Mocha
wallust theme Dracula

# Or generate from wallpaper
wallust run /path/to/image.jpg
```

### Apps that auto-update:
- ✅ Kitty terminal
- ✅ Waybar
- ✅ Fuzzel launcher
- ✅ Mako notifications
- ✅ Hyprland borders/colors
- ✅ fzf fuzzy finder
- ✅ ncspot (Spotify TUI)
- ✅ Starship prompt
- ✅ tmux
- ✅ Neovim

### Theme templates
Located in `~/.config/wallust/templates/`

## 🛠️ CLI Tools

| Tool | Purpose | Key Binding |
|------|---------|-------------|
| **fzf** | Fuzzy finder | `Ctrl+T` (files), `Ctrl+G` (cd), `Ctrl+R` (history) |
| **fd** | Modern `find` | Aliased to `find` |
| **bat** | Better `cat` | Syntax highlighting |
| **eza** | Modern `ls` | Aliased to `ls` |
| **zoxide** | Smart `cd` | `z <partial-path>` |
| **ripgrep** | Fast grep | `rg` |

## ⌨️ Key Bindings

### Window Management
| Key | Action |
|-----|--------|
| `Super + Return` | Terminal |
| `Super + Q` | Close window |
| `Super + R` | App launcher (Fuzzel) |
| `Super + E` | File manager |
| `Super + 1-9` | Switch workspace |

### Applications
| Key | Action |
|-----|--------|
| `Super + B` | Browser |
| `Super + C` | VS Code |
| `Super + G` | Steam |

### FZF (in terminal)
| Key | Action |
|-----|--------|
| `Ctrl+T` | Fuzzy find files |
| `Ctrl+G` | Fuzzy cd |
| `Ctrl+R` | Fuzzy history |

## 📦 System Features

### Update Cache Timer
Automatically refreshes package update counts every hour for Waybar display.

```bash
systemctl --user status update-cache.timer
```

### Startup Sound
Custom startup sound plays when Hyprland launches.

## 🚀 Quick Deploy

### On a new Arch machine:
```bash
# 1. Install base packages
sudo pacman -S git chezmoi zsh fzf fd bat eza zoxide hyprland waybar kitty

# 2. Clone and apply dotfiles
chezmoi init cd4u2b0z/dotfiles --apply

# 3. Enable timers
systemctl --user daemon-reload
systemctl --user enable --now update-cache.timer

# 4. Apply theme
wallust theme Everforest-Dark-Medium
source ~/.zshrc

# 5. Set zsh as default
chsh -s $(which zsh)
```

### Sync changes
```bash
# After making changes
chezmoi re-add <files>
chezmoi cd && git add -A && git commit -m "update" && git push

# On another machine
chezmoi update
```

## 📁 Structure

```
~/.config/
├── hypr/
│   ├── hyprland.conf         # WM config
│   └── scripts/startup-sound.sh
├── kitty/kitty.conf
├── waybar/
│   ├── config
│   ├── style.css
│   └── scripts/
├── wallust/
│   ├── wallust.toml          # Theme config
│   ├── templates/            # Color templates
│   └── scripts/              # Post-theme hooks
├── mako/config
├── fuzzel/
├── ncspot/config.toml
└── starship.toml

~/.local/bin/                 # Custom scripts
~/.cache/wallust/             # Generated theme files
```

## 🖼️ Display

- **Resolution**: 3840x2160 (4K)
- **Scaling**: 1.33x
- **Monitor**: 32" display
- **GPU**: NVIDIA RTX 3090

## 📋 See Also

- [CHEATSHEET.md](CHEATSHEET.md) - Full CLI tools & chezmoi reference

---

*Dynamic theming with Wallust on Arch Linux + Hyprland* 🌲
