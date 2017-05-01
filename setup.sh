#!/bin/sh
echo 'install zplug'
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

echo 'install dependencies'
sudo apt-get install build-essentials git tmux tig htop ack xsel docker mysql-server redis-client postgresql imagemagick node vim tree ack

echo 'create dirs'
mkdir wiki
mkdir code

echo 'install dotfiles'
git clone https://github.com/alaibe/dotfiles.git code/dotfiles
ln -s $HOME/code/dotfiles/ack/ackrc .ackrc
ln -s $HOME/code/dotfiles/ctags/ctags .ctags
ln -s $HOME/code/dotfiles/git/config .gitconfig
ln -s $HOME/code/dotfiles/git/ignore .gitignore
ln -s $HOME/code/dotfiles/git/message .gitmessage
ln -s $HOME/code/dotfiles/ruby/railsrc .railsrc
ln -s $HOME/code/dotfiles/ruby/rspec .rspec
ln -s $HOME/code/dotfiles/ruby/gemrc .gemrc
ln -s $HOME/code/dotfiles/ruby/irbrc .irbrc
ln -s $HOME/code/dotfiles/tmux/tmux.conf .tmux.conf
ln -s $HOME/code/dotfiles/vim .vim
ln -s $HOME/code/dotfiles/vim/vimrc .vimrc
ln -s $HOME/code/dotfiles/zsh/zshrc .zshrc
ln -s $HOME/code/dotfiles/zsh/zshenv .zshenv
ln -s $HOME/code/dotfiles/bin bin

git clone https://github.com/gmarik/vundle.git .vim/bundles/vundle
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
sh .fzf/install
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
