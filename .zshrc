# ZSHrc Wotts

export PATH="$HOME/.local/bin:$PATH"
export VISUAL=vim
export EDITOR="$VISUAL"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY

# prompt
autoload -Uz add-zsh-hook vcs_info
setopt prompt_subst

# https://github.com/zsh-users/zsh/blob/master/Misc/vcs_info-examples
# https://codeberg.org/Swindlers-Inc/dotfiles/src/branch/main/.zshrc
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' actionformats $' %b|%a%m'
zstyle ':vcs_info:*' formats $' %b%m'

zstyle ':vcs_info:git*+set-message:*' hooks git-check

# set git info
+vi-git-check() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]]; then
    UNPUSHED=$(git log --oneline @{u}.. 2> /dev/null | wc -l)
    if [[ -n $UNPUSHED ]] && [[ $UNPUSHED != '0' ]]; then
      hook_com[misc]+=$(echo " $UNPUSHED")
    fi
    UNPULLED=$(git log --oneline ..@{u} 2> /dev/null | wc -l)
    if [[ -n $UNPULLED ]] && [[ $UNPULLED != '0' ]]; then
      hook_com[misc]+=$(echo " $UNPULLED")
    fi

    GIT_STATUS=$(git status --porcelain)
    # Staged files
    STAGED=$(echo $GIT_STATUS | grep -v '??' | grep -v "^ " | grep -v "^$" | wc -l)
    if [[ -n $STAGED ]] && [[ $STAGED != '0' ]]; then
      hook_com[misc]+=" +$STAGED"
    fi
    # Unstaged files
    UNSTAGED=$(echo $GIT_STATUS | grep -v '??' | grep "^ " | wc -l)
    if [[ -n $UNSTAGED ]] && [[ $UNSTAGED != '0' ]]; then
      hook_com[misc]+=" !$UNSTAGED"
    fi
    # Untracked files
    UNTRACKED=$(echo $GIT_STATUS | grep '??' | wc -l)
    if [[ -n $UNTRACKED ]] && [[ $UNTRACKED != '0' ]]; then
      hook_com[misc]+=" ?$UNTRACKED"
    fi
  fi
}

preexec() {
  # set command execution time
  # this function is not called on empty input
  typeset -ig STARTTIME=SECONDS
}

precmd() {
  PWD=${$(pwd)//\/home\/wotts/\~}

  # git info
  vcs_info
  GITINFO=""
  if [ -n "$vcs_info_msg_0_" ]; then
    GITINFO=" ⎇ ${vcs_info_msg_0_}     "
  fi

  # command exit status
  EXITCODE=$?
  STATUS=󰋙
  STATUSCOLOR=green
  STATUSCODE=''
  if [ $EXITCODE -ne 0 ]; then
    STATUS=󰫈
    STATUSCOLOR=red
    STATUSCODE="- $EXITCODE"
  fi

  TIME=$(date +%T)

  # calculate the fill-line width
  GAPLENGTH=$(( COLUMNS-$#PWD-$#GITINFO-$#TIME-$#STATUSCODE-44 ))

  BGSTART="%F{236}░%F{236}▒%F{236}▓%K{236}%F{15}"
  BGEND="%k%F{236}▓%F{236}▒%F{236}░%f"
  SEPARATOR=" %F{244}%f "

  # get command execution time
  DURATION=0
  DURATION=$(( SECONDS-STARTTIME ))
  if (( STARTTIME > 0 )) && (( DURATION > 0 )); then
    TIMEFG=15

    if [ $DURATION -gt 20 ]; then
      TIMEFG=3
    fi

    if [ $DURATION -gt 60 ]; then
      TIMEFG=1
    fi
    EXECUTIONTIME="$BGSTART%F{${TIMEFG}}$(( $DURATION / 60 ))m $(( $DURATION % 60 ))s%f$BGEND"
  else
    EXECUTIONTIME=""
  fi
  # reset starttime on empty input
  typeset -ig STARTTIME=-1

  print -P "\n┌─${BGSTART} %B%F{6} %f ${SEPARATOR} %F{4}  ${PWD}  ${SEPARATOR} %F{2}${GITINFO}%b ${BGEND}${(r:$GAPLENGTH::─:)}${BGSTART} %F{$STATUSCOLOR}${STATUS} ${STATUSCODE} ${SEPARATOR} ${TIME} ${BGEND} %f─┐"
  export RPROMPT="󰄽 ${EXECUTIONTIME} ╾┘"
}

ZLE_RPROMPT_INDENT=0
export PROMPT="└─╼ %F{1}󰅂%F{2}󰅂%F{3}󰅂%F{4}󰅂%f "

# requires coreutils
alias ls="gls --color"
export CLICOLOR=1
export LS_COLORS="di=36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=37;41:sg=30;43:tw=30;42:ow=34;42:"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select


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
