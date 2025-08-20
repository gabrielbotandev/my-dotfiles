# My Dotfiles 🚀

A collection of my personal dotfiles and configurations for Windows development environment. This repository contains configurations for various tools and applications I use daily to create a productive and beautiful development setup.

## ⚠️ Important Note

**This repository currently contains ONLY my Windows dotfiles. My macOS configurations are not included yet and will be added in a future update.**

## 🛠️ Tools & Applications

### Terminal Setup

- **Warp** - Modern terminal with AI capabilities
- **PowerShell 7** - Cross-platform shell
- **Oh My Posh** - Custom prompt engine for PowerShell
- **Starship** - Cross-shell prompt (alternative to Oh My Posh)
- **lsd** - Modern `ls` replacement with colors and icons

### Window Management

- **Komorebi** - Tiling window manager for Windows
- **YASB** - Yet Another Status Bar

### Code Editors

- **Cursor** - AI-powered code editor
- **VS Code** - Popular code editor
- **Neovim** - Modern Vim editor with plugin ecosystem
- **Custom CSS and JS Loader** - Extension for custom styling

### Themes & Styling

- **Ayu Mirage Zed** - Theme inspired by Zed editor
- **JetBrains Product Icons** - Clean icon theme

## 📦 Installation Guide

### 1. Terminal Setup

#### Install Warp

```powershell
# Using winget
winget install Warp.Warp

# Or download from https://warp.dev/
```

#### Install PowerShell 7

```powershell
# Using winget
winget install Microsoft.PowerShell

# Or using Chocolatey
choco install powershell-core
```

#### Install Oh My Posh

```powershell
# Using winget
winget install JanDeDobbeleer.OhMyPosh

# Or using Chocolatey
choco install oh-my-posh
```

#### Install Starship (Alternative to Oh My Posh)

```powershell
# Using winget
winget install Starship.Starship

# Or using Chocolatey
choco install starship
```

#### Install lsd

```powershell
# Using winget
winget install Peltoche.lsd

# Or using Chocolatey
choco install lsd
```

### 2. PowerShell Modules

Install required PowerShell modules:

```powershell
Install-Module -Name Terminal-Icons -Repository PSGallery
Install-Module -Name PSReadLine -Repository PSGallery
```

### 3. Window Management

#### Install Komorebi

```powershell
# Using winget
winget install LGUG2Z.Komorebi

# Or using Chocolatey
choco install komorebi
```

#### Install YASB

```powershell
# Using winget
winget install LGUG2Z.YASB

# Or using Chocolatey
choco install yasb
```

### 4. Code Editor Setup

#### Install Neovim

```powershell
# Using winget
winget install Neovim.Neovim

# Or using Chocolatey
choco install neovim

# Or download from https://neovim.io/
```

#### Install Neovim Dependencies

```powershell
# Install Node.js (required for CoC)
winget install OpenJS.NodeJS

# Install Yarn (for CoC extensions)
npm install -g yarn

# Install vim-plug (plugin manager)
# Create the autoload directory
New-Item -ItemType Directory -Path "$env:LOCALAPPDATA\nvim\autoload" -Force

# Download vim-plug
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" -OutFile "$env:LOCALAPPDATA\nvim\autoload\plug.vim"
```

#### Install Custom CSS and JS Loader Extension

For both Cursor and VS Code:

1. Open the Extensions panel (Ctrl+Shift+X)
2. Search for "Custom CSS and JS Loader"
3. Install the extension by `be5invis`

#### Apply Custom Styling

1. Copy the `custom.css` file from either `cursor/` or `vscode/` folder to your Documents folder
2. Update the path in your settings.json:
   ```json
   "vscode_custom_css.imports": ["file:///C:/Users/YOUR_USERNAME/Documents/custom.css"]
   ```
3. Reload the editor (Ctrl+Shift+P → "Developer: Reload Window")

## 🔧 Configuration Files

### Neovim Configuration

- **Location**: `nvim/init.vim`
- **Plugin Manager**: vim-plug
- **Key Features**:
  - **CoC (Conquer of Completion)** - Advanced autocompletion with language servers
  - **NERDTree** - File explorer (Ctrl+F, Ctrl+N, Ctrl+T)
  - **vim-airline** - Enhanced status bar with Powerline symbols
  - **vim-devicons** - File type icons
  - **Tagbar** - Code navigation and structure (F8)
  - **vim-surround** - Surround text with brackets/quotes
  - **vim-commentary** - Easy commenting (gcc, gc)
  - **vim-multiple-cursors** - Multiple cursor support (Ctrl+N)
  - **auto-pairs** - Automatic bracket/quote completion
  - **vim-jsx-pretty** - JSX/TSX syntax highlighting and indentation

#### CoC Extensions Installed:

- `coc-tslint-plugin` - TypeScript linting
- `coc-tsserver` - TypeScript language server
- `coc-css` - CSS language support
- `coc-html` - HTML language support
- `coc-json` - JSON language support
- `coc-prettier` - Code formatting

#### Key Mappings:

- `<C-f>` - Focus NERDTree
- `<C-n>` - Open NERDTree
- `<C-t>` - Toggle NERDTree
- `<C-l>` - Jump to definition (CoC)
- `<F8>` - Toggle Tagbar
- `<Tab>` - Confirm autocompletion

#### Editor Settings:

- Relative line numbers
- 4-space indentation
- Mouse support enabled
- UTF-8 encoding
- No preview for autocompletion

### PowerShell Profile

- **Location**: `powershell/Profile.ps1`
- **Features**:
  - Oh My Posh prompt with Robby Russell theme
  - Git aliases (gst, ga, wip, etc.)
  - Custom functions (poff, init, rd, whereis)
  - Terminal-Icons and PSReadLine modules
  - Chocolatey integration

### Starship Configuration

- **Location**: `starship/starship.toml`
- **Features**:
  - Custom prompt format with username, hostname, directory
  - Git integration with status indicators
  - Python environment display
  - Command duration tracking
  - Custom symbols and colors

### Komorebi Configuration

- **Location**: `komorebi/komorebi.json`
- **Features**:
  - Tiling window management
  - Custom workspace layouts
  - Application-specific ignore rules
  - Smooth animations
  - Multi-monitor support

### Editor Configurations

#### Cursor Settings

- **Location**: `cursor/settings.json`
- **Features**:
  - Ayu Mirage Zed theme
  - Custom CSS styling
  - Optimized editor settings
  - Git integration
  - Prettier formatting

#### VS Code Settings

- **Location**: `vscode/settings.json`
- **Features**:
  - Similar to Cursor but with VS Code-specific optimizations
  - GitHub Copilot integration
  - Enhanced security settings

#### Custom CSS

- **Location**: `cursor/custom.css` and `vscode/custom.css`
- **Features**:
  - Zed-inspired styling
  - Custom command center appearance
  - Status bar modifications
  - Font customization (Lilex font)

### Additional Tools

#### lsd Configuration

- **Location**: `lsd/`
- **Features**:
  - Custom colors and icons
  - Optimized display settings

#### YASB Configuration

- **Location**: `yasb/`
- **Features**:
  - Custom status bar styling
  - System information display

## 🚀 Quick Setup

1. **Clone this repository**:

   ```bash
   git clone https://github.com/yourusername/my-dotfiles.git
   cd my-dotfiles
   ```

2. **Install all tools** (run the installation commands above)

3. **Copy configuration files**:

   ```powershell
   # PowerShell profile
   Copy-Item "powershell\Profile.ps1" "$PROFILE" -Force

   # Starship config
   Copy-Item "starship\starship.toml" "$env:USERPROFILE\.config\starship.toml" -Force

   # Komorebi config
   Copy-Item "komorebi\komorebi.json" "$env:USERPROFILE\.config\komorebi\komorebi.json" -Force

   # Neovim config
   Copy-Item "nvim\init.vim" "$env:LOCALAPPDATA\nvim\init.vim" -Force
   ```

4. **Apply editor settings**:

   - Copy the settings.json files to your editor's configuration directory
   - Install the Custom CSS and JS Loader extension
   - Apply the custom CSS styling

5. **Install Neovim plugins**:
   ```bash
   # Open Neovim and install plugins
   nvim
   # Then run :PlugInstall
   # After that, install CoC extensions:
   :CocInstall coc-tslint-plugin coc-tsserver coc-css coc-html coc-json coc-prettier
   ```

## 🎨 Customization

### Fonts

The custom CSS uses the **Lilex** font (same as Zed editor). You can change this by:

1. Installing your preferred font
2. Updating the `font-family` property in the CSS files

### Themes

Both Cursor and VS Code use the **Ayu Mirage Zed** theme. You can install it from the marketplace or change to your preferred theme.

### Colors

The configurations use a purple/cyan color scheme. You can customize colors in:

- Starship configuration (`starship.toml`)
- Custom CSS files
- Komorebi border colors

## 🔄 Updates

To update your dotfiles:

```bash
git pull origin main
# Re-copy the configuration files you want to update
```

## 📝 Notes

- The PowerShell profile includes both Oh My Posh and Starship configurations (Starship is commented out)
- Komorebi is configured to ignore certain applications (games, launchers, etc.)
- The custom CSS makes the editors look as close as possible to Zed
- All configurations are optimized for Windows but should work on WSL

## 🤝 Contributing

Feel free to submit issues and enhancement requests!

**Happy coding! 🎉**
