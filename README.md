# Dotfiles

Personal dotfiles for terminal, shell, launcher, and editor configuration on
macOS and Linux.

This repository uses one directory per tool:

- `kitty/kitty.conf`
- `ghostty/config`
- `zsh/.zshrc`
- `rofi/config.rasi`

The setup below uses symbolic links. After linking a config, edits made in this
repository are used directly by the application.

## Before You Start

Clone this repository:

```sh
mkdir -p ~/projects
git https://github.com/gabrielbotandev/dotfiles.git ~/projects/dotfiles
cd ~/projects/dotfiles
```

Back up any existing configs:

```sh
mkdir -p ~/.config-backup
cp -a ~/.config/kitty ~/.config-backup/kitty 2>/dev/null || true
cp -a ~/.config/rofi ~/.config-backup/rofi 2>/dev/null || true
cp -a ~/.zshrc ~/.config-backup/.zshrc 2>/dev/null || true
```

Install the fonts used by these configs:

- Terminus TTF for Kitty
- JetBrains Mono Nerd Font for Ghostty, Rofi, and prompt icons

## Kitty

Kitty is the recommended terminal for Linux in this dotfiles setup. It also
works well on macOS.

### macOS

Install Kitty with Homebrew:

```sh
brew install --cask kitty
```

Link the config:

```sh
mkdir -p ~/.config/kitty
ln -sf ~/projects/dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf
```

The Kitty config includes `current-theme.conf`. Create it by selecting the
Carbonfox theme:

```sh
kitty +kitten themes --reload-in=all Carbonfox
```

Restart Kitty or reload the config with `ctrl+shift+f5`.

### Ubuntu

Install Kitty:

```sh
sudo apt update
sudo apt install -y kitty
```

Link the config:

```sh
mkdir -p ~/.config/kitty
ln -sf ~/projects/dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf
```

Create the included theme file:

```sh
kitty +kitten themes --reload-in=all Carbonfox
```

### Fedora

Install Kitty:

```sh
sudo dnf install -y kitty
```

Link the config:

```sh
mkdir -p ~/.config/kitty
ln -sf ~/projects/dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf
```

Create the included theme file:

```sh
kitty +kitten themes --reload-in=all Carbonfox
```

### Arch Linux

Install Kitty:

```sh
sudo pacman -S --needed kitty
```

Link the config:

```sh
mkdir -p ~/.config/kitty
ln -sf ~/projects/dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf
```

Create the included theme file:

```sh
kitty +kitten themes --reload-in=all Carbonfox
```

### Useful Kitty Shortcuts

- `alt+h`, `alt+j`, `alt+k`, `alt+l`: move between panes
- `alt+enter`: open a new pane in the same directory
- `alt+w`: close the current pane
- `alt+t`: open a new tab in the same directory
- `alt+1` through `alt+9`: jump to a tab
- `alt+z`: toggle the temporary zoom layout
- `alt+u`: open URL hints
- `alt+f`: open file path hints
- `alt+g`: open `file:line` hints in Neovim

## Ghostty

Ghostty setup in this repository is macOS-only. For Linux, I strongly recommend
Kitty instead of Ghostty.

### macOS

Install Ghostty with Homebrew:

```sh
brew install --cask ghostty
```

Link the config:

```sh
mkdir -p "$HOME/Library/Application Support/com.mitchellh.ghostty"
ln -sf "$HOME/projects/dotfiles/ghostty/config" \
  "$HOME/Library/Application Support/com.mitchellh.ghostty/config"
```

Restart Ghostty after linking the config.

## Zsh

The Zsh config uses Oh My Zsh and enables these plugins:

- `git`
- `fzf`
- `zsh-autosuggestions`
- `zsh-syntax-highlighting`

It also initializes `zoxide` and adds `~/.local/bin` to `PATH`.

### macOS

Install dependencies:

```sh
brew install zsh curl git fzf zoxide
```

Install Oh My Zsh:

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Install the external Oh My Zsh plugins:

```sh
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions" 2>/dev/null || true
git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" 2>/dev/null || true
```

Link the config:

```sh
ln -sf ~/projects/dotfiles/zsh/.zshrc ~/.zshrc
```

Make Zsh the default shell:

```sh
chsh -s "$(which zsh)"
```

Restart the terminal after changing the shell.

### Ubuntu

Install dependencies:

```sh
sudo apt update
sudo apt install -y zsh curl git fzf zoxide
```

Install Oh My Zsh:

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Install the external Oh My Zsh plugins:

```sh
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions" 2>/dev/null || true
git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" 2>/dev/null || true
```

Link the config:

```sh
ln -sf ~/projects/dotfiles/zsh/.zshrc ~/.zshrc
```

Make Zsh the default shell:

```sh
chsh -s "$(which zsh)"
```

Log out and log back in after changing the shell.

### Fedora

Install dependencies:

```sh
sudo dnf install -y zsh curl git fzf zoxide
```

Install Oh My Zsh:

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Install the external Oh My Zsh plugins:

```sh
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions" 2>/dev/null || true
git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" 2>/dev/null || true
```

Link the config:

```sh
ln -sf ~/projects/dotfiles/zsh/.zshrc ~/.zshrc
```

Make Zsh the default shell:

```sh
chsh -s "$(which zsh)"
```

Log out and log back in after changing the shell.

### Arch Linux

Install dependencies:

```sh
sudo pacman -S --needed zsh curl git fzf zoxide
```

Install Oh My Zsh:

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Install the external Oh My Zsh plugins:

```sh
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions" 2>/dev/null || true
git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" 2>/dev/null || true
```

Link the config:

```sh
ln -sf ~/projects/dotfiles/zsh/.zshrc ~/.zshrc
```

Make Zsh the default shell:

```sh
chsh -s "$(which zsh)"
```

Log out and log back in after changing the shell.

## Rofi

Rofi is a Linux launcher. It is not part of the macOS setup.

### Ubuntu

Install Rofi:

```sh
sudo apt update
sudo apt install -y rofi
```

Link the config:

```sh
mkdir -p ~/.config/rofi
ln -sf ~/projects/dotfiles/rofi/config.rasi ~/.config/rofi/config.rasi
```

Run Rofi:

```sh
rofi -show drun
```

### Fedora

Install Rofi:

```sh
sudo dnf install -y rofi
```

Link the config:

```sh
mkdir -p ~/.config/rofi
ln -sf ~/projects/dotfiles/rofi/config.rasi ~/.config/rofi/config.rasi
```

Run Rofi:

```sh
rofi -show drun
```

### Arch Linux

Install Rofi:

```sh
sudo pacman -S --needed rofi
```

Link the config:

```sh
mkdir -p ~/.config/rofi
ln -sf ~/projects/dotfiles/rofi/config.rasi ~/.config/rofi/config.rasi
```

Run Rofi:

```sh
rofi -show drun
```

## Quick Relink

Linux:

```sh
mkdir -p ~/.config/kitty ~/.config/rofi
ln -sf ~/projects/dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -sf ~/projects/dotfiles/rofi/config.rasi ~/.config/rofi/config.rasi
ln -sf ~/projects/dotfiles/zsh/.zshrc ~/.zshrc
```

macOS:

```sh
mkdir -p ~/.config/kitty
mkdir -p "$HOME/Library/Application Support/com.mitchellh.ghostty"
ln -sf ~/projects/dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -sf "$HOME/projects/dotfiles/ghostty/config" \
  "$HOME/Library/Application Support/com.mitchellh.ghostty/config"
ln -sf ~/projects/dotfiles/zsh/.zshrc ~/.zshrc
```
