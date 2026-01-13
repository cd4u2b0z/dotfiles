# 🚀 Installation Guide

This guide will help you set up Craig's Nord-themed Arch Linux configuration from scratch.

## 📋 Prerequisites

- Fresh Arch Linux installation
- Internet connection
- Basic familiarity with terminal commands

## 🏗️ Phase 1: Base System Setup

### 1. Update System
```bash
sudo pacman -Syu
```

### 2. Install Yay (AUR Helper)
```bash
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd .. && rm -rf yay
```

### 3. Install Core Dependencies
```bash
# Hyprland and Wayland essentials
yay -S hyprland-git kitty waybar wofi dunst hyprpaper polkit-gnome

# Audio
yay -S pipewire pipewire-alsa pipewire-pulse pavucontrol

# Fonts and themes
yay -S ttf-jetbrains-mono-nerd inter-font arc-gtk-theme papirus-icon-theme

# File management
yay -S thunar thunar-archive-plugin thunar-media-tags-plugin
yay -S gvfs gvfs-mtp gvfs-smb file-roller

# Productivity tools
yay -S chezmoi fzf ripgrep fd bat timeshift
yay -S gnome-disk-utility
```

## 🎨 Phase 2: Theme Setup

### 1. Install Themes and Icons
```bash
# Icons
yay -S papirus-icon-theme

# GTK themes
yay -S arc-gtk-theme

# Cursor theme (included with most installations)
```

### 2. Configure Font Rendering
```bash
# Install font configuration
sudo pacman -S fontconfig

# Create font config (if needed)
mkdir -p ~/.config/fontconfig
```

## 🗂️ Phase 3: Dotfiles Management

### 1. Initialize Chezmoi
```bash
chezmoi init
```

### 2. Add Configurations (if setting up manually)
```bash
# Core configs
chezmoi add ~/.config/hypr/hyprland.conf
chezmoi add ~/.config/kitty/kitty.conf
chezmoi add ~/.config/starship.toml

# Theme configs
chezmoi add ~/.config/gtk-3.0/settings.ini
chezmoi add ~/.config/gtk-4.0/settings.ini
chezmoi add ~/.gtkrc-2.0

# Scripts
chezmoi add ~/.local/bin
```

### 3. Create Git Repository (optional)
```bash
cd ~/.local/share/chezmoi
git remote add origin https://github.com/yourusername/dotfiles.git
git branch -M main
git push -u origin main
```

## ⚙️ Phase 4: System Services

### 1. Enable Essential Services
```bash
# For Timeshift scheduled backups
sudo systemctl enable --now cronie.service

# For automatic mounting
sudo systemctl enable --now udisks2.service
```

### 2. Configure UFW (if not already done)
```bash
sudo ufw enable
sudo ufw default deny incoming
sudo ufw default allow outgoing
```

## 🖥️ Phase 5: Display Configuration

### 1. Configure Hyprland for 4K
Edit `~/.config/hypr/hyprland.conf`:
```bash
# Monitor configuration for 4K
monitor = DP-1,3840x2160@144,0x0,1.0

# Environment variables for 4K
env = GDK_SCALE,1.0
env = QT_AUTO_SCREEN_SCALE_FACTOR,1
```

### 2. Test Display Settings
```bash
# Reload Hyprland
hyprctl reload
```

## 🎯 Phase 6: Application Setup

### 1. Configure Default Applications
```bash
# Set default browser (if needed)
xdg-settings set default-web-browser librewolf.desktop

# Set default file manager
xdg-mime default thunar.desktop inode/directory
```

### 2. Install Additional Software
```bash
# Browsers
yay -S librewolf-bin brave-bin

# Development
yay -S visual-studio-code-bin

# Media
yay -S vlc

# Gaming (optional)
yay -S steam lutris
```

## 🔧 Phase 7: Final Configuration

### 1. Apply Theme
```bash
# Run the theme application script
~/.local/bin/apply-dark-theme
```

### 2. Test Everything
```bash
# Check theme status
~/.local/bin/theme-check

# Test file manager
thunar

# Test terminal
kitty

# Test applications
```

### 3. Set Up Timeshift
```bash
# Open Timeshift GUI
sudo timeshift-gtk

# Configure:
# - Snapshot location
# - Schedule (daily/weekly)
# - Number of snapshots to keep
```

## 🚀 Phase 8: Automation Setup

### 1. Create System Update Script
```bash
# Create update script
mkdir -p ~/.local/bin
cat > ~/.local/bin/system-update << 'EOF'
#!/bin/bash
echo "🔄 Updating system packages..."
yay -Syu --noconfirm
echo "✅ System updated successfully!"
EOF

chmod +x ~/.local/bin/system-update
```

### 2. Set Up Automated Snapshots
Configure in Timeshift GUI:
- Enable scheduled snapshots
- Set frequency (daily recommended)
- Configure retention (keep 5-7 snapshots)

## 🧪 Phase 9: Testing & Validation

### 1. Test Core Functionality
- [ ] Hyprland starts correctly
- [ ] 4K display works at native resolution
- [ ] Dark theme applied consistently
- [ ] File manager shows dark background
- [ ] Archive extraction works
- [ ] USB/phone mounting works

### 2. Test Productivity Tools
- [ ] fzf works in terminal
- [ ] Theme switching works
- [ ] Custom scripts execute
- [ ] Timeshift creates snapshots

### 3. Test Applications
- [ ] Browser launches with Wayland
- [ ] VS Code opens correctly
- [ ] Audio controls work
- [ ] File operations work

## 🎉 Completion

Congratulations! You now have a fully configured Nord-themed Arch Linux system with:

✅ Modern Wayland compositor (Hyprland)
✅ Native 4K support with readable fonts
✅ Consistent dark theme across all applications
✅ Productive file management with Thunar
✅ Managed dotfiles with chezmoi
✅ System snapshots with Timeshift
✅ Modern productivity tools

## 🆘 Troubleshooting

### Common Issues

**Theme not applying:**
```bash
~/.local/bin/apply-dark-theme
pkill thunar; ~/.local/bin/thunar-dark
```

**Display issues:**
```bash
# Check monitor configuration
hyprctl monitors
# Edit hyprland.conf monitor line
```

**Mounting issues:**
```bash
sudo systemctl restart udisks2
```

**Font too small:**
- Edit font sizes in GTK config files
- Increase terminal font size in kitty.conf

### Getting Help

1. Check the main README.md
2. Use the theme-check script
3. Review Hyprland logs: `journalctl -u hyprland`
4. Check Arch Wiki for specific issues

---

*Happy computing with your new Nord-themed setup! ❄️*