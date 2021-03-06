#!/bin/sh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm .zshrc

echo 'create dirs'
mkdir local
mkdir .config/nvim

echo 'install dotfiles'
git clone https://github.com/alaibe/dotfiles.git dotfiles
ln -s $HOME/dotfiles/ack/ackrc .ackrc
ln -s $HOME/dotfiles/git/config .gitconfig
ln -s $HOME/dotfiles/git/ignore .gitignore
ln -s $HOME/dotfiles/git/message .gitmessage
ln -s $HOME/dotfiles/ruby/railsrc .railsrc
ln -s $HOME/dotfiles/ruby/rspec .rspec
ln -s $HOME/dotfiles/ruby/gemrc .gemrc
ln -s $HOME/dotfiles/ruby/irbrc .irbrc
ln -s $HOME/dotfiles/tmux/tmux.conf .tmux.conf
ln -s $HOME/dotfiles/tmux/tmux-osx.conf .tmux-osx.conf
ln -s $HOME/dotfiles/vim .vim
ln -s $HOME/dotfiles/vim/vimrc .vimrc
ln -s $HOME/dotfiles/zsh/zshrc .zshrc
ln -s $HOME/dotfiles/bin bin
ln -s $HOME/dotfiles/nvim/init.vim .config/nvim/init.vim

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.5.0
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
