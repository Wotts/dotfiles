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

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats '%b'
zstyle ':vcs_info:*' actionformats '%b(%a)'

preexec() {
  # set command execution time
  # this function is not called on empty input
  typeset -ig STARTTIME=SECONDS
}

precmd() {
  PWD="  ${$(pwd)//\/home\/wotts/󰋜 \~}"

  # git info
  GIT_INFO=""
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]]; then
    vcs_info
    GIT_INFO="  ⎇  ${vcs_info_msg_0_}"

    UNPUSHED=$(git log --oneline @{u}.. 2> /dev/null | wc -l)
    UNPUSHED=$( echo ${UNPUSHED} | xargs) # trim mysterious whitespace
    UNPULLED=$(git log --oneline ..@{u} 2> /dev/null | wc -l)
    UNPULLED=$( echo ${UNPULLED} | xargs)

    if [[ $(($UNPUSHED)) > 0 || $(($UNPULLED)) > 0 ]]; then
      GIT_INFO="${GIT_INFO}  "
    fi

    if [[ $(($UNPUSHED)) > 0 ]]; then
      GIT_INFO="${GIT_INFO} ${UNPUSHED}"
    fi

    if [[ $(($UNPULLED)) > 0 ]]; then
      GIT_INFO="${GIT_INFO} ${UNPULLED}"
    fi

    GIT_STATUS=$(git status --porcelain)
    STAGED=$(echo $GIT_STATUS | grep -c '^??')
    (( STAGED > 0 )) && GIT_INFO="${GIT_INFO} +${STAGED}"
    UNSTAGED=$(echo $GIT_STATUS | grep -c '^\sM')
    (( UNSTAGED > 0 )) && GIT_INFO="${GIT_INFO} !${UNSTAGED}"
    UNTRACKED=$(echo $GIT_STATUS | grep -c '^A\s')
    (( UNTRACKED > 0 )) && GIT_INFO="${GIT_INFO} ?${UNTRACKED}"
  fi


  # command exit status
  EXIT_CODE=$?
  CMD_STATUS=󰋙
  STATUS_COLOR=green
  STATUS_CODE=''
  if [ $EXIT_CODE -ne 0 ]; then
    CMD_STATUS=󰫈
    STATUS_COLOR=red
    STATUS_CODE="- $EXIT_CODE"
  fi

  TIME=$(date +%T)

  # calculate the fill-line width
  GAP_LENGTH=$(( COLUMNS-$#PWD-$#GIT_INFO-$#TIME-$#STATUS_CODE-37 ))

  BGSTART="%F{236}░%F{236}▒%F{236}▓%K{236}%F{15}"
  BGEND="%k%F{236}▓%F{236}▒%F{236}░%f"
  SEPARATOR=" %F{244}%f "

  # get command execution time
  DURATION=0
  DURATION=$(( SECONDS-STARTTIME ))
  if (( STARTTIME > 0 )) && (( DURATION > 0 )); then
    TIMEFG=15
    MIN=""
    SEC=""

    if (( DURATION >= 20 )); then
      TIMEFG=3
    elif (( DURATION >= 60 )); then
      TIMEFG=1
    fi

    if (( DURATION / 60 )); then
      MIN="$(( $DURATION / 60 ))m"
    fi

    if (( DURATION % 60 )); then
      SEC="$(( $DURATION % 60 ))"
      SEC="${SEC}s"
    fi

    EXECUTIONTIME="$BGSTART %F{${TIMEFG}}$MIN$SEC%f $BGEND"
  else
    EXECUTIONTIME=""
  fi
  # reset starttime on empty input
  typeset -ig STARTTIME=-1

  print -P "\n%F{242}╭─${BGSTART} %B%F{6} %f ${SEPARATOR} %F{4}${PWD} ${SEPARATOR}%F{2}${GIT_INFO}%b ${BGEND}%F{242}${(r:$GAP_LENGTH::·:)}${BGSTART} %F{$STATUS_COLOR}${CMD_STATUS} ${STATUS_CODE} ${SEPARATOR} ${TIME} ${BGEND}%F{242}─╮"
  export RPROMPT="󰄽  ${EXECUTIONTIME}%F{242}╾╯"
}

ZLE_RPROMPT_INDENT=0
export PROMPT="%F{242}╰─╼ %F{1}󰅂%F{2}󰅂%F{3}󰅂%F{4}󰅂%f "

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
alias ls="ls -l --color"
#alias ssh='ghostty +ssh --'

# wholesome aliases
alias yeet="rm -rf"
alias please='sudo $(fc -ln -1)'

# eza aliases
alias els='eza --long --all --header --modified --git --classify --icons --sort=name'
alias ezatree='eza --long --all --header --modified --git --classify --icons --tree --sort=name'


# plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

