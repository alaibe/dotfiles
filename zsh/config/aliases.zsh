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
alias lg='lazygit'

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
alias tat='~/bin/tmux-sessionizer'
alias ts='~/bin/tmux-sessionizer'
alias tm='~/bin/tmux-sessionizer'

# Project navigation
alias pn='~/bin/project-nav'
alias pc='~/bin/project-nav cd'
alias pt='~/bin/project-nav tmux'
alias pcode='~/bin/project-nav code'

# System maintenance
alias update='~/bin/dotfiles-update'
alias brewup='brew update && brew upgrade && brew cleanup'

# Better ls with eza (exa replacement)
if command -v eza &> /dev/null; then
    alias ls='eza'
    alias ll='eza -alF'
    alias la='eza -a'
    alias tree='eza --tree'
elif command -v exa &> /dev/null; then
    alias ls='exa'
    alias ll='exa -alF'
    alias la='exa -a'
    alias tree='exa --tree'
fi

# Better cat with bat (if installed)
if command -v bat &> /dev/null; then
    alias cat='bat'
fi

# Zoxide for smarter cd (if installed)
if command -v zoxide &> /dev/null; then
    eval "$(zoxide init zsh)"
    alias cd='z'
    alias cdi='zi'  # Interactive cd
fi

# McFly for better history search (if installed)
if command -v mcfly &> /dev/null; then
    eval "$(mcfly init zsh)"
    export MCFLY_KEY_SCHEME=vim
    export MCFLY_FUZZY=2
fi

# Delta for better git diffs (if installed)
if command -v delta &> /dev/null; then
    alias diff='delta'
fi

# Claude Code integration
if command -v claude &> /dev/null; then
    alias ai='claude'
    alias ask='claude'
    alias code-help='claude --help'
fi

# Modern Clojure development (deps.edn era)
alias clj='clojure'
alias repl='clj -M:dev:test'           # Start REPL with dev/test paths
alias nrepl='clj -M:dev:test:nrepl'    # Start nREPL server
alias test-clj='clj -X:test'           # Run tests
alias lint-clj='clj-kondo --lint src test'
alias bb='babashka'

# Modern tooling
alias neil='neil'                      # Project scaffolding
alias jet='jet'                        # JSON/EDN transformation

# Common deps.edn tasks
alias deps-tree='clj -X:deps tree'
alias deps-check='clj -X:deps find-versions'
alias new-clj='neil new app'           # Modern project creation
alias new-lib='neil new lib'
alias add-dep='neil add dep'           # Add dependencies
alias search-dep='neil dep search'     # Search for dependencies

# Build and deployment (if using tools.build)
alias build='clj -T:build jar'
alias clean='clj -T:build clean'
alias uberjar='clj -T:build uber'

# ClojureScript development
alias shadow='clj -M:shadow'
alias shadow-watch='clj -M:shadow watch app'
alias shadow-release='clj -M:shadow release app'
alias figwheel='clj -M:figwheel'
alias cljs-repl='clj -M:shadow browser-repl'
alias cljs-test='clj -M:cljs-test'

# Install shadow-cljs globally if using npm
alias shadow-install='npm install -g shadow-cljs'
