# Git aliases (in addition to oh-my-zsh git plugin)
alias gs='git status'
alias gp='git push'
alias gl='git pull'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gaa='git add --all'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gd='git diff'
alias gdc='git diff --cached'
alias glog='git log --oneline --graph --decorate'

# Editor aliases
alias vi='nvim'
alias vim='nvim'

# Shell config shortcuts  
alias zshconfig='nvim ~/.zshrc'
alias ohmyzsh='nvim ~/.oh-my-zsh'
alias reload='source ~/.zshrc'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias -- -='cd -'

# List files
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Utilities
alias h='history'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# macOS specific
alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Development
alias serve='python3 -m http.server'
alias myip='curl ipinfo.io/ip'

# tmux
alias ta='tmux attach'
alias tls='tmux list-sessions'
alias tat='~/bin/tat'
alias ts='tmux-sessionizer'
alias tm='tmux-sessionizer'

# Project navigation
alias pn='project-nav'
alias pc='project-nav cd'
alias pt='project-nav tmux'  
alias pcode='project-nav code'

# System maintenance
alias update='dotfiles-update'
alias brewup='brew update && brew upgrade && brew cleanup'

# Better ls with exa (if installed)
if command -v exa &> /dev/null; then
    alias ls='exa'
    alias ll='exa -alF'
    alias la='exa -a'
    alias tree='exa --tree'
fi

# Better cat with bat (if installed)  
if command -v bat &> /dev/null; then
    alias cat='bat'
fi