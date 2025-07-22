# Environment Variables

# Editor
export EDITOR='nvim'
export VISUAL='nvim'

# Path additions (removed since it's redundant with Homebrew shellenv)

# History settings
export HISTSIZE=50000
export SAVEHIST=50000
export HISTFILE=~/.zsh_history

# History options
setopt EXTENDED_HISTORY      # Write timestamps to history file
setopt INC_APPEND_HISTORY    # Write to history file immediately
setopt SHARE_HISTORY         # Share history between sessions
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first
setopt HIST_IGNORE_DUPS      # Don't record duplicates
setopt HIST_IGNORE_ALL_DUPS  # Delete old duplicate entries
setopt HIST_FIND_NO_DUPS     # Don't display duplicates when searching
setopt HIST_IGNORE_SPACE     # Don't record entries starting with space
setopt HIST_SAVE_NO_DUPS     # Don't write duplicate entries
setopt HIST_VERIFY           # Show command with history expansion before running

# FZF configuration
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='
  --height 40%
  --layout=reverse
  --border
  --preview "bat --style=numbers --color=always --line-range :500 {}"
  --bind "ctrl-y:execute-silent(echo {} | pbcopy)+abort"
  --color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9
  --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9
  --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6
  --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4
'

# FZF history search function
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//' )
}

# Language specific
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Development
export NODE_ENV=development

# Less configuration  
export LESS='-R -F -X'
export PAGER='less'

# Grep colors
export GREP_COLOR='1;32'

# macOS specific
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Add Homebrew to PATH for Apple Silicon
    eval "$(/opt/homebrew/bin/brew shellenv)"
    
    # Use GNU tools if available
    export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
    export PATH="/opt/homebrew/opt/gnu-tar/libexec/gnubin:$PATH"
fi