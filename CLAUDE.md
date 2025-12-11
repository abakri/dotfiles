# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository that manages configuration files for various development tools on macOS. The repository uses Dotbot for automated symlink management and installation.

## Installation and Setup

### Initial Setup
```bash
cd ~/personal/dotfiles
./install
```

The `install` script uses Dotbot to create symlinks from this repository to the appropriate locations in the home directory based on `install.conf.yaml`.

### Full System Setup
For a fresh system installation:
```bash
cd ~/personal/dotfiles
cp .gitconfig.local.template .gitconfig.local
# Edit .gitconfig.local with personal information
./setup.sh
```

This script:
1. Checks for `.gitconfig.local` and creates from template if missing (prompts for editing)
2. Runs the Dotbot installer
3. Installs Homebrew if not present
4. Installs all packages from `Brewfile` using `brew bundle install`
5. Sets up tmux plugin manager (TPM)

### Post-Installation
- Install a Nerd Font (Hack recommended) from https://github.com/ryanoasis/nerd-fonts
- Launch tmux and press `Ctrl+Space` + `I` to install tmux plugins

## Architecture

### Configuration Files Structure

**Symlink Mappings** (defined in `install.conf.yaml`):
- `~/.config/nvim` → `nvim/` directory
- `~/.tmux.conf` → `tmux.conf`
- `~/.zshrc` → `zshrc`
- `~/.gitconfig` → `gitconfig`
- `~/Library/Application Support/lazygit/config.yml` → `lazygitconfig.yml`
- Various other shell and tool configurations

**Git Configuration Pattern**:
- User-specific git config (name, email, GPG key) is kept in `.gitconfig.local` (not tracked)
- The tracked `gitconfig` file includes `.gitconfig.local` via `[include]` directive
- Template file `.gitconfig.local.template` provides structure for new machine setup
- This prevents accidentally committing personal information

**Neovim Configuration**:
- Entry point: `nvim/init.lua`
- Plugin management: Uses lazy.nvim, plugins defined in `nvim/lua/plugins/` directory
- LSP configurations: Located in `nvim/lsp/` directory
  - `basedpyright.lua` - Python LSP using basedpyright
  - `gopls.lua` - Go LSP with custom root directory detection for GOMODCACHE and stdlib
  - `ruff.lua` - Python linting/formatting
  - `vtsls.lua` - TypeScript/JavaScript LSP
  - `lua_ls.lua` - Lua LSP
- Native LSP enabled via `vim.lsp.enable()` in init.lua:281
- VSCode compatibility: `nvim/lua/vscode-neovim/init.lua` provides config when running in VSCode Neovim extension

### Key Neovim Architecture Notes

**Plugin System**:
- Lazy.nvim loads all plugins from `nvim/lua/plugins/` via `require('lazy').setup('plugins')`
- Main plugin list in `nvim/lua/plugins/init.lua`
- Specialized configs in separate files (neotest.lua, blink-cmp.lua, treesitter.lua, etc.)

**LSP Configuration Pattern**:
- Uses native Neovim LSP config API: `vim.lsp.config()`
- LSP servers enabled via `vim.lsp.enable()` with server names
- Custom root directory detection for gopls to handle Go stdlib and module cache
- Diagnostics configured with virtual_text disabled, using floating windows instead

**Key Plugins**:
- fzf-lua: Fuzzy finder (replaced Telescope)
- blink-cmp: Completion engine
- nvim-tree: File explorer
- Harpoon: Quick file navigation
- Neotest: Test runner integration
- treesitter: Syntax highlighting and code understanding
- flash.nvim: Quick navigation

**Leader Key**: Space (`<leader>`)

## Common Commands

### Testing (when in a project with tests)
These commands depend on project-specific test setups via neotest:
- Run nearest test: Use neotest keybindings (defined in `nvim/lua/plugins/neotest.lua`)

### Neovim LSP Operations
- Go to definition: `gd`
- Find references: `gr` (uses fzf-lua)
- Format: `<leader>f`
- Hover: `<leader>h`
- Code action: `<leader>.`
- Rename: `<leader>rr`
- Diagnostics: `<leader>do` (open float), `<leader>d]` (prev), `<leader>d[` (next)

### Package Management
Homebrew packages are managed via `Brewfile`. To install new packages:
```bash
# Edit Brewfile, then:
brew bundle install
```

### Modifying Dotfiles
After making changes to configuration files in this repository, the symlinks automatically reflect the changes (since files are symlinked, not copied). For new files, update `install.conf.yaml` and run `./install`.

## Language-Specific Notes

**Python**:
- Uses pyenv for version management
- LSP: basedpyright for type checking, ruff for linting/formatting
- Python 3.11 installed via Homebrew

**TypeScript/JavaScript**:
- LSP: vtsls (replaced typescript-tools)
- Tab width: 2 spaces (auto-configured via FileType autocmd in init.lua:181)
- TSC plugin available for project-wide diagnostics: `<leader>wd`

**Go**:
- LSP: gopls with custom root directory detection
- Handles GOMODCACHE and GOROOT stdlib properly (see nvim/lsp/gopls.lua:72-86)

**Lua**:
- LSP: lua_ls
- Used for Neovim configuration
