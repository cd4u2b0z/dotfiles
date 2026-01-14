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

# Install paru (AUR helper)
git clone https://aur.archlinux.org/paru.git
cd paru && makepkg -si
```

### 2. Apply Dotfiles
```bash
chezmoi init cd4u2b0z/dotfiles --apply
```

### 3. Install Packages
```bash
# Desktop
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

If you're on CachyOS with Hyprland pre-installed, many packages are already there:

```bash
# 1. Install chezmoi and apply
sudo pacman -S chezmoi
chezmoi init cd4u2b0z/dotfiles --apply

# 2. CachyOS likely has these already - install what's missing
paru -S --needed zsh starship fzf fd bat eza zoxide ripgrep
paru -S --needed wallust ncspot fastfetch

# 3. Fonts (if not installed)
paru -S --needed ttf-jetbrains-mono-nerd ttf-inter

# 4. Set zsh as default
chsh -s $(which zsh)

# 5. Apply theme
wallust theme Everforest-Dark-Medium
source ~/.zshrc
```

#### Update Timer Options

The `update-cache.timer` refreshes package update counts hourly for the Waybar update module. CachyOS has its own update notification, so choose one:

**Option A: Use the systemd timer (same as Arch)**
```bash
systemctl --user daemon-reload
systemctl --user enable --now update-cache.timer
```

**Option B: Use cronie instead**

If you prefer cron or systemd user timers aren't working:
```bash
# Install cronie
paru -S cronie
sudo systemctl enable --now cronie

# Add hourly job (edit with: crontab -e)
crontab -e
```

Add this line:
```
0 * * * * ~/.config/waybar/scripts/refresh-update-cache.sh
```

This runs the update check every hour at :00.

**Option C: Skip it**

If you're using CachyOS's built-in update checker, you can skip this entirely. The Waybar updates module will still work, it just won't auto-refresh in the background.

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

### Hyprland
| Key | Action |
|-----|--------|
| `Super + Return` | Terminal |
| `Super + Q` | Close window |
| `Super + R` | App launcher |
| `Super + E` | File manager |
| `Super + 1-9` | Workspace |
| `Super + B` | Browser |
| `Super + C` | VS Code |

### FZF (terminal)
| Key | Action |
|-----|--------|
| `Ctrl+T` | Fuzzy find files |
| `Ctrl+G` | Fuzzy cd |
| `Ctrl+R` | Fuzzy history |
| `**<Tab>` | Trigger completion |

### Zoxide
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
