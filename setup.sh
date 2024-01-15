#!/bin/sh

sudo apt install git
git clone https://github.com/alaibe/dotfiles.git dotfiles

xargs -a ~/dotfiles/packages/general.txt sudo apt-get -y install
xargs -a ~/dotfiles/packages/apps.txt sudo apt-get -y install
xargs -a ~/dotfiles/packages/status.txt sudo apt-get -y install

echo 'create dirs'
mkdir .config/nvim
mkdir code
mkdir code/status-im

echo 'install dotfiles'
ln -sf $HOME/dotfiles/ack/ackrc .ackrc
ln -sf $HOME/dotfiles/git/config .gitconfig
ln -sf $HOME/dotfiles/git/ignore .gitignore
ln -sf $HOME/dotfiles/git/message .gitmessage
ln -sf $HOME/dotfiles/tmux/tmux.conf .tmux.conf
ln -sf $HOME/dotfiles/vim .vim
ln -sf $HOME/dotfiles/nvim/init.vim .config/nvim/init.vim
ln -sf $HOME/dotfiles/nvim/coc-settings.json .config/nvim/coc-settings.json

ln -sf $HOME/dotfiles/bin bin

wget https://repo.anaconda.com/archive/Anaconda3-2022.05-Linux-x86_64.sh
bash Anaconda3-2022.05-Linux-x86_64.sh
rm Anaconda3-2022.05-Linux-x86_64.sh

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm .zshrc
ln -sf $HOME/dotfiles/zsh/zshrc .zshrc

source ~/.zshrc

asdf plugin-add pnpm
asdf plugin-add nodejs
asdf plugin-add nim
asdf plugin-add php
asdf plugin add golang https://github.com/asdf-community/asdf-golang.git
asdf install pnpm 8.7.6
asdf install php latest
asdf install golang 1.20.10
asdf install nodejs 18.18.2
asdf install nim 2.0.2
asdf global pnpm 8.7.6
asdf global php latest
asdf global golang 1.20.10
asdf global nim 2.0.2
asdf global nodejs 18.18.2

nimble install nimlangserver

pnpm install -g vscode-json-languageserver

go install golang.org/x/tools/gopls@latest


