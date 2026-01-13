# 🏔️ Craig's Nord-Themed Arch Setup

A beautiful, minimal, and productive Arch Linux configuration with a Nord color scheme, native 4K support, and Mint-like convenience.

## 🎯 Overview

This is a carefully crafted Arch Linux setup that combines:
- **Speed**: Arch Linux base with optimized Hyprland
- **Beauty**: Nord theme consistency across all applications
- **Productivity**: Modern tools and keyboard-driven workflow
- **Reliability**: Proper dotfiles management and system snapshots

## 🖥️ Desktop Environment

- **Window Manager**: Hyprland (Wayland compositor)
- **Terminal**: Kitty with Nord theme
- **Shell**: Zsh with Starship prompt
- **File Manager**: Thunar with dark Arc theme
- **Application Launcher**: Wofi
- **Status Bar**: Waybar (if configured)

## 🎨 Theme & Visual

- **GTK Theme**: Arc-Dark
- **Icon Theme**: Papirus-Dark
- **Font**: Inter 14pt (4K optimized)
- **Color Scheme**: Nord
- **Cursor**: Adwaita
- **Native Resolution**: 4K (3840x2160@144Hz) with 1.0x scaling

## 🚀 Key Features

### Native 4K Support
- No system scaling - applications use larger fonts individually
- Crisp text and icons at 4K resolution
- Optimized font sizes for readability

### Nord Theme Consistency
- Hyprland borders match Nord palette
- Kitty terminal with Nord colors
- Starship prompt with Nord styling
- Arc-Dark GTK theme for consistent dark backgrounds

### Productivity Tools
- **chezmoi**: Dotfiles management
- **fzf**: Fuzzy finder for files and commands
- **ripgrep**: Fast text search
- **fd**: Modern find replacement
- **bat**: Better cat with syntax highlighting

### File Management
- Thunar with plugins:
  - Archive support (extract/compress)
  - Media tags for music files
- Full mounting support (USB, phones, network shares)
- Dark theme integration

## ⌨️ Key Bindings

### Window Management
- `Super + Return`: Open terminal
- `Super + Q`: Close window
- `Super + R`: Application launcher
- `Super + E`: File manager
- `Super + 1-9`: Switch workspaces

### Applications
- `Super + B`: LibreWolf browser
- `Super + Shift + B`: Brave browser
- `Super + C`: VS Code
- `Super + G`: Steam

### Theme Management
- `Super + T`: Apply dark theme
- `Super + Shift + T`: Check theme status
- `Super + Shift + E`: Modern theme manager
- `Super + Ctrl + E`: Classic theme manager

## 📁 Directory Structure

```
~/.config/
├── hypr/hyprland.conf      # Window manager config
├── kitty/kitty.conf        # Terminal config
├── starship.toml           # Shell prompt config
├── gtk-3.0/settings.ini    # GTK theme config
└── gtk-4.0/settings.ini    # GTK4 theme config

~/.local/bin/
├── apply-dark-theme        # Theme switcher script
├── thunar-dark            # Dark Thunar launcher
├── librewolf-wayland      # Optimized browser launcher
├── brave-wayland          # Optimized browser launcher
└── theme-check            # Theme status checker

~/.gtkrc-2.0               # GTK2 theme config
```

## 🛠️ Installation & Setup

### Quick Setup (with this dotfiles repo)
```bash
# Install chezmoi
yay -S chezmoi

# Clone and apply dotfiles
chezmoi init https://github.com/yourusername/dotfiles
chezmoi apply
```

### Manual Setup
See the detailed installation guide in `docs/installation.md`

## 🔧 Customization

### Changing Themes
- Use `Super + Shift + E` to open the modern theme manager
- Edit theme settings in the GTK config files
- Restart applications for changes to take effect

### Adding Applications
- Edit `~/.config/hypr/hyprland.conf` to add keybindings
- Create launcher scripts in `~/.local/bin/` for complex applications

### Font Scaling
- Edit font sizes in GTK config files for better 4K scaling
- Adjust terminal font size in `~/.config/kitty/kitty.conf`

## 🚑 Troubleshooting

### Theme Issues
```bash
# Check theme status
~/.local/bin/theme-check

# Reapply themes
~/.local/bin/apply-dark-theme

# Open theme manager
nwg-look
```

### Display Issues
- Check Hyprland monitor configuration
- Verify native 4K settings in config

## 📦 Included Software

### Core System
- Hyprland (window manager)
- Kitty (terminal)
- Zsh + Starship (shell + prompt)
- Thunar (file manager)

### Productivity
- chezmoi (dotfiles management)
- fzf, ripgrep, fd, bat (CLI tools)
- file-roller (archive manager)
- timeshift (system snapshots)

### System Tools
- pavucontrol (audio control)
- gnome-disk-utility (disk management)
- gvfs (mounting support)

## 🤝 Contributing

Feel free to:
- Fork this repository
- Suggest improvements
- Report issues
- Share your customizations

## 📄 License

This configuration is open source and available under the MIT License.

---

*Crafted with ❄️ for a productive and beautiful Arch Linux experience*