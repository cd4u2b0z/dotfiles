# 🏔️ Craig's Dotfiles

Arch Linux + Hyprland configuration with dynamic theming via wallust.

## 📦 What's Included

### Window Manager & Desktop
| Component | Config |
|-----------|--------|
| **Hyprland** | Window manager, hypridle, hyprlock |
| **Waybar** | Status bar + 40+ custom scripts |
| **Fuzzel** | Application launcher |
| **Wofi** | Alternative launcher |
| **Mako** | Notification daemon |

### Terminal & Shell
| Component | Config |
|-----------|--------|
| **Kitty** | GPU-accelerated terminal |
| **Zsh** | Shell + enhanced config |
| **Starship** | Cross-shell prompt |
| **Tmux** | Terminal multiplexer |

### Theming & Wallpapers
| Component | Config |
|-----------|--------|
| **Wallust** | Dynamic color generation from wallpapers |
| **GTK 3/4** | Arc-Dark theme settings |
| **Fontconfig** | Font configuration |
| **Themes** | Custom theme files |

### Applications
| Component | Config |
|-----------|--------|
| **Neovim** | Full Lua config + LSP + plugins |
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

### Custom Scripts (`~/.local/bin/`)
| Script | Purpose |
|--------|---------|
| `wallpaper-manager` | Main wallpaper + theming controller |
| `theme-switcher` | Switch color themes |
| `quick-wallpaper` | Fast wallpaper change |
| `lock-and-sleep` | Screen lock + suspend |
| `power-status` | Battery/power info |
| `brave-wayland` | Launch Brave with Wayland flags |
| `thunar-dark` | Launch Thunar with dark theme |

## 🎨 Dynamic Theming

Wallust generates colors from your wallpaper and applies them to:
- Kitty terminal
- Waybar
- Hyprland borders
- Fuzzel
- Starship prompt
- GTK apps
- Cava visualizer

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

## 🚀 Installation

```bash
# On a new machine
chezmoi init --apply <your-repo>

# Or manually
chezmoi init
chezmoi apply
```

## 📊 Stats

- **275 files** managed
- **Last updated**: January 2026
- **Display**: 4K @ 144Hz (no scaling)
- **Theme**: Dynamic via wallust

---
*Managed with [chezmoi](https://chezmoi.io)*
