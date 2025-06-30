#/bin/bash

# ideally, create a `~/personal` folder and clone this repo there
# run installation
cd ~/personal/dotfiles
./install

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

# install brew packages using Brewfile
brew bundle install # this should be expecting ~/Brewfile

# add tmux plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm # to install tmux plugins run prefix + I in tmux

# don't forget to download a NerdFont at `https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Hack.zip` and install it
