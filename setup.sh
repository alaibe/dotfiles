#!/bin/sh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm .zshrc

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
ln -s $HOME/code/dotfiles/emacs/spacemacs .spacemacs

git clone https://github.com/gmarik/vundle.git .vim/bundles/vundle
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
cd .fzf;sh install;cd -
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.5.0
git clone https://github.com/syl20bnr/spacemacs.git ~/.emacs.d

asdf plugin-add ruby
asdf plugin-add nodejs
asdf plugin-add golang
