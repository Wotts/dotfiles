# ZSHrc Wotts

export PATH="$HOME/.local/bin:$PATH"

# prompt
autoload -Uz add-zsh-hook vcs_info
setopt prompt_subst
add-zsh-hook precmd vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats '%b%u%c'
zstyle ':vcs_info:git*' actionformats '%F{14}⏱ %*%f'
zstyle ':vcs_info:git*' unstagedstr '*'
zstyle ':vcs_info:git*' stagedstr '+'
zstyle ':vcs_info:*:*' check-for-changes true

# requires coreutils
alias ls="gls --color"
export CLICOLOR=1
export LS_COLORS="di=31"
export LS_COLORS="di=36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=37;41:sg=30;43:tw=30;42:ow=34;42:"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select

export PROMPT='%(?.%F{2}⏺.%F{1}⏺)%f %~ %F{2}⎇  ${vcs_info_msg_0_}%f %F{3}>%f '
export RPROMPT='%F{8}⏱ %*%f'

# cli
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[alias]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[path]='none'

# keybinds
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

# aliases
alias ssh='ghostty +ssh --'

alias lb="cd ~/lb/stack-2.0"
alias pest="~/lb/stack-2.0/backend/learnavel/vendor/bin/pest"

# wholesome aliases
alias yeet="rm -rf"
alias please='sudo $(fc -ln -1)'

# eza aliases
alias els='eza --long --all --all --header --modified --git --classify --sort=name'
alias ezatree='eza --long --all --header --modified --git --classify --tree --sort=name'

# plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
