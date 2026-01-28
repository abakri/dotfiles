#/bin/bash

# All commands in this script must be idempotent — safe to run multiple times without side effects.

cd "$(dirname "$0")"

# Create local gitconfig if it doesn't exist
if [ ! -f .gitconfig.local ]; then
    echo "Creating .gitconfig.local from template..."
    cp .gitconfig.local.template .gitconfig.local
    echo "Please edit .gitconfig.local with your personal information (name, email, GPG key)"
    read -p "Press enter to continue after editing .gitconfig.local..."
fi

./install

# install homebrew
if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# install brew packages using Brewfile
brew bundle install # this should be expecting ~/Brewfile

# add tmux plugins
if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm # to install tmux plugins run prefix + I in tmux
fi

# don't forget to download a NerdFont at `https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Hack.zip` and install it
