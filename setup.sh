#!/bin/sh

# Install Homebrew if not already installed
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install git via Homebrew
brew install git

# Clone dotfiles if not already cloned
if [ ! -d "$HOME/code/dotfiles" ]; then
    mkdir -p ~/code
    git clone https://github.com/alaibe/dotfiles.git $HOME/code/dotfiles
fi

# Install packages via Homebrew Bundle
brew bundle install --file=~/code/dotfiles/Brewfile

echo 'create dirs'
mkdir -p ~/.config/nvim

echo 'install dotfiles'
ln -sf $HOME/code/dotfiles/ack/ackrc ~/.ackrc
ln -sf $HOME/code/dotfiles/git/config ~/.gitconfig
ln -sf $HOME/code/dotfiles/git/ignore ~/.gitignore
ln -sf $HOME/code/dotfiles/git/message ~/.gitmessage
ln -sf $HOME/code/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -sf $HOME/code/dotfiles/nvim/init.vim ~/.config/nvim/init.vim

ln -sf $HOME/code/dotfiles/bin ~/bin

# Install asdf via Homebrew
brew install asdf

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm ~/.zshrc
ln -sf $HOME/code/dotfiles/zsh/zshrc ~/.zshrc

# Load asdf for this setup session (Homebrew version)
eval "$(/opt/homebrew/bin/brew shellenv)"
. $(brew --prefix asdf)/libexec/asdf.sh

asdf plugin-add pnpm
asdf plugin-add nodejs
asdf plugin add golang https://github.com/asdf-community/asdf-golang.git
asdf install pnpm latest
asdf install golang 1.20.10
asdf install nodejs 18.18.2
asdf global pnpm latest
asdf global golang 1.20.10
asdf global nodejs 18.18.2

pnpm install -g vscode-json-languageserver

go install golang.org/x/tools/gopls@latest


