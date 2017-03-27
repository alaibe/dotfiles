#!/bin/sh

echo 'install oh-my-zsh'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo 'install dependencies'
sudo apt-get install build-essentials git tmux tig htop ack xsel docker mysql-server redis-client postgresql

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
ln -s $HOME/code/dotfiles/bin bin

git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/gmarik/vundle.git .vim/bundles/vundle
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
sh .fzf/install
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
