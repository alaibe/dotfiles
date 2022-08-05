#!/bin/sh

sudo snap install bitwarden discord brave spotify notion-snap
sudo snap install code --classic
sudo apt install git
git clone https://github.com/alaibe/dotfiles.git dotfiles

xargs -a ~/dotfiles/packages/general.txt sudo apt-get -y install
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

ln -sf $HOME/dotfiles/bin bin

wget https://repo.anaconda.com/archive/Anaconda3-2022.05-Linux-x86_64.sh
bash Anaconda3-2022.05-Linux-x86_64.sh
rm Anaconda3-2022.05-Linux-x86_64.sh

wget https://go.dev/dl/go1.18.5.linux-amd64.tar.gz
sudo tar -C /opt/ -xzf go1.18.5.linux-amd64.tar.gz
rm go1.18.5.linux-amd64.tar.gz

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm .zshrc
ln -sf $HOME/dotfiles/zsh/zshrc .zshrc

source ~/.zshrc
