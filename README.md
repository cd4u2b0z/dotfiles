# 🏔️ Craig's Dotfiles

Arch Linux + Hyprland configuration with **dynamic theming via wallust** - colors sync across all apps.

## 📦 What's Included

### Window Manager & Desktop
| Component | Config |
|-----------|--------|
| **Hyprland** | Window manager, hypridle, hyprlock |
| **Waybar** | Status bar with floating design, margin, rounded corners |
| **Fuzzel** | Application launcher |
| **Wofi** | Alternative launcher |
| **Mako** | Notification daemon (dynamic colors) |

### Terminal & Shell
| Component | Config |
|-----------|--------|
| **Kitty** | GPU-accelerated terminal |
| **Zsh** | Shell + `wtheme` command for theme switching |
| **Starship** | Cross-shell prompt |
| **Tmux** | Terminal multiplexer (dynamic statusline colors) |

### Theming & Wallpapers
| Component | Config |
|-----------|--------|
| **Wallust** | Dynamic color generation from wallpapers/themes |
| **GTK 3/4** | Dark theme with libadwaita support |
| **Fontconfig** | Font configuration |
| **Themes** | Nord, Everforest, Gruvbox, Catppuccin, and more |

### Applications
| Component | Config |
|-----------|--------|
| **Neovim** | Full Lua config + LSP + dynamic lualine colors |
| **Btop** | System monitor |
| **Fastfetch** | System info |
| **Cava** | Audio visualizer + shaders |
| **Thunar** | File manager + custom actions |
| **MangoHud** | Gaming performance overlay |

### Music
| Component | Config |
|-----------|--------|
| **Ncmpcpp** | MPD client |
| **Ncspot** | Spotify TUI |
| **MPD** | Music daemon |

## 🎨 Dynamic Theming System

### What Syncs Automatically
When you run `wtheme <theme-name>`, these update instantly:
- **Waybar** - Bar colors + calendar tooltip
- **Kitty** - Terminal colors
- **Mako** - Notification colors
- **Tmux** - Statusline colors
- **Hyprland** - Border colors
- **Fuzzel** - Launcher colors
- **Starship** - Prompt colors
- **GTK apps** - Via gtk.css
- **Cava** - Visualizer colors

**Neovim** uses wallust colors on startup (restart nvim after theme switch)

### Available Themes
```bash
wtheme Nord
wtheme Everforest-Dark-Medium
wtheme Gruvbox-Dark
wtheme Catppuccin-Mocha
wtheme Dracula
wtheme Tokyo-Night
# ... and 400+ more (run: wallust theme --help)
```

### Wallust Templates
Located in `~/.config/wallust/templates/`:
| Template | Target |
|----------|--------|
| `kitty-colors.conf` | Kitty terminal |
| `waybar-colors.css` | Waybar CSS variables |
| `hyprland-colors.conf` | Hyprland borders |
| `fuzzel-colors.ini` | Fuzzel launcher |
| `starship.toml` | Starship prompt |
| `gtk-colors.css` | GTK 3/4 apps |
| `cava-colors` | Cava visualizer |
| `tmux-colors.conf` | Tmux statusline |
| `nvim-colors.lua` | Neovim colorscheme |
| `mako-colors.conf` | Mako notifications |

### Custom Scripts
| Script | Purpose |
|--------|---------|
| `~/.config/wallust/scripts/update-waybar-calendar.sh` | Updates waybar calendar colors |

## ⌨️ Key Bindings

| Binding | Action |
|---------|--------|
| `Super + Return` | Terminal |
| `Super + Q` | Close window |
| `Super + R` | App launcher |
| `Super + E` | File manager |
| `Super + B` | Browser |
| `Super + 1-9` | Workspaces |
| `Super + W` | Wallpaper manager |

## 🖥️ Waybar Features

- **Floating design** with 6px margin and 12px border-radius
- **Dynamic calendar tooltip** - colors match current theme
- **Custom modules**: weather, system stats, updates, app tray
- **GTK_THEME fix** for pavucontrol dark mode

## 🚀 Installation

```bash
# On a new machine
chezmoi init --apply <your-repo>

# Or manually
chezmoi init
chezmoi apply

# Generate initial colors
wallust theme Nord
```

## 📊 Stats

- **280+ files** managed
- **Last updated**: January 13, 2026
- **Display**: 4K @ 144Hz (native, no scaling)
- **Theme**: Dynamic via wallust

---
*Managed with [chezmoi](https://chezmoi.io)*
