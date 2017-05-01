function rbinstall() {
  command ruby-install ruby $(cat .ruby-version) > /dev/null
  gem install bundler pry
}

eval "$(rbenv init --no-rehash - zsh)"

alias rubies="rbenv versions"
