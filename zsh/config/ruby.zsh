function rbinstall() {
  command ruby-install ruby $(cat .ruby-version) > /dev/null
  gem install bundler pry
}
