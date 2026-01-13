# Dotfiles

Personal development environment configuration for macOS. This repository manages configuration files for Neovim, tmux, zsh, git, and other development tools using automated symlink management with Dotbot.

## What's Included

- **Neovim**: Modern IDE-like experience with LSP, fuzzy finding, completion, and more
- **tmux**: Terminal multiplexer configuration
- **zsh**: Shell configuration with custom settings
- **Git**: Version control configuration with local user settings support
- **lazygit**: Terminal UI for git operations
- **Homebrew**: Package management via Brewfile

## Quick Start

### Fresh System Setup

```bash
# 1. Clone the repository
cd ~ && mkdir -p personal && cd personal
git clone <your-repo-url> dotfiles
cd dotfiles

# 2. Set up personal git configuration
cp .gitconfig.local.template .gitconfig.local
# Edit .gitconfig.local with your name, email, and GPG key (if applicable)

# 3. Run the setup script (installs everything)
./setup.sh
```

The setup script will:
- Create all necessary symlinks to your home directory
- Install Homebrew (if not already installed)
- Install all packages from `Brewfile`
- Set up tmux plugin manager (TPM)

### Post-Installation

1. **Install a Nerd Font** (required for icons in terminal):
   - Download [Hack Nerd Font](https://github.com/ryanoasis/nerd-fonts)
   - Install and set as your terminal font

2. **Install tmux plugins**:
   - Launch tmux: `tmux`
   - Press `Ctrl+Space` + `I` to install plugins

### Updating Existing Installation

If you already have the dotfiles set up and just want to refresh:

```bash
cd ~/personal/dotfiles
./install
```

## What Gets Configured

The installation creates symlinks from this repository to your system:

| Source | Destination |
|--------|-------------|
| `nvim/` | `~/.config/nvim` |
| `tmux.conf` | `~/.tmux.conf` |
| `zshrc` | `~/.zshrc` |
| `gitconfig` | `~/.gitconfig` |
| `lazygitconfig.yml` | `~/Library/Application Support/lazygit/config.yml` |

> Files are symlinked, not copied, so changes to files in this repo are immediately reflected in your system.

## Neovim Configuration

### Key Features

- **Plugin Manager**: lazy.nvim for fast, modular plugin loading
- **LSP Support**: Native LSP with language servers for:
  - Python (basedpyright + ruff)
  - TypeScript/JavaScript (vtsls)
  - Go (gopls)
  - Lua (lua_ls)
- **Fuzzy Finding**: fzf-lua for files, buffers, and code search
- **Completion**: blink-cmp for intelligent code completion
- **File Explorer**: nvim-tree
- **Quick Navigation**: Harpoon for bookmarking files
- **Testing**: neotest integration for running tests

### Essential Keybindings

**Leader key**: `Space`

#### Navigation
- `<leader>pf` - Find files
- `<leader>ps` - Search text in project
- `gd` - Go to definition
- `gr` - Find references

#### LSP Operations
- `<leader>h` - Show hover documentation
- `<leader>.` - Code actions
- `<leader>rr` - Rename symbol
- `<leader>f` - Format file

#### Diagnostics
- `<leader>do` - Open diagnostic float
- `<leader>d]` - Next diagnostic
- `<leader>d[` - Previous diagnostic

#### File Management
- `<leader>pv` - Toggle file explorer

## Managing Packages

All system packages are defined in `Brewfile`. To add new packages:

1. Edit `Brewfile` and add your package
2. Run: `brew bundle install`

## Git Configuration

Personal git information (name, email, GPG key) is kept in `.gitconfig.local`, which is:
- Not tracked in version control
- Automatically included by the main `gitconfig`
- Created from `.gitconfig.local.template` during setup

This prevents accidentally committing personal information.

## Language-Specific Setup

### Python
- Version management via pyenv
- Python 3.11 installed via Homebrew
- LSP: basedpyright (type checking) + ruff (linting/formatting)

### TypeScript/JavaScript
- LSP: vtsls
- Auto-configured with 2-space indentation

### Go
- LSP: gopls with custom configuration for stdlib and module cache

### Lua
- LSP: lua_ls
- Used for Neovim configuration

## Troubleshooting

### Symlinks not working
Run `./install` again to refresh all symlinks.

### Homebrew packages not installing
Make sure Homebrew is installed: `brew --version`
If not, the setup script should install it automatically.

### Neovim LSP not working
Ensure language servers are installed. Most are installed via Mason or Homebrew. Check `:LspInfo` in Neovim.

### Icons not showing in terminal
Install and configure a Nerd Font in your terminal emulator.

## Contributing

This is a personal dotfiles repository, but feel free to fork and adapt for your own use!

## File Structure

```
dotfiles/
├── nvim/                  # Neovim configuration
│   ├── init.lua          # Entry point
│   ├── lua/
│   │   ├── plugins/      # Plugin configurations
│   │   └── vscode-neovim/ # VSCode integration
│   └── lsp/              # LSP server configs
├── install.conf.yaml     # Dotbot symlink mappings
├── setup.sh              # Full system setup script
├── install               # Dotbot installer
├── Brewfile              # Homebrew packages
├── tmux.conf             # tmux configuration
├── zshrc                 # zsh configuration
├── gitconfig             # Git configuration
└── README.md             # This file
```
