#/bin/bash

# ideally, create a `~/personal` folder and clone this repo there

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

# install needed packages
brew install node
brew install ripgrep # needed for telescope grep

# install tmux
brew install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm # to install tmux plugins run prefix + I in tmux

# install neovim
brew install --HEAD neovim
# in order to install neovim plugins, run `nvim ~/.config/nvim/lua/aslan/plugins.lua`, then `:so` and `:PackerSync`
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.neovim

# don't forget to download a NerdFont at `https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Hack.zip` and install it

# run installation
cd ~/personal/dotfiles
./install
