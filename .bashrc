# BASHrc
shopt -s cdspell
shopt -s histappend
shopt -s checkwinsize
HISTCONTROL=ignoredups:erasedups
HISTSIZE=10000
HISTFILESIZE=1000

export LC_ALL=nl_NL.UTF-8
export LANG=en_GB.UTF-8
export LANGUAGE=en_GB.UTF-8

export VISUAL=vim
export RANGER_LOAD_DEFAULT_RC=false
export EDITOR="$VISUAL"

export LESS="-SR -# 10"

export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi



# Colors and prompt
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

LS_COLORS=$LS_COLORS:'di=0;34:fi=0;0:ln=0;94:ex=0;32' ; export LS_COLORS

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/( ⎇  \1 )/'
}

virtualenv_info(){
    if [[ -n "$VIRTUAL_ENV" ]]; then
        venv="${VIRTUAL_ENV##*/}"
    else
        venv=''
    fi
    [[ -n "$venv" ]] && echo "(venv:$venv) "
}

export VIRTUAL_ENV_DISABLE_PROMPT=1
sep1="▓▒░ "
sep2=" ░▒▓"
green="\[\e[1;32m\]"
red="\[\e[31m\]"
yellow="\[\e[33m\]"
cyan="\[\e[34m\]"
whiteback="\[\e[1;30;107m\]"
whitetocyan="\[\e[39m\e[46m\]"
cyanback="\[\e[1;30;46m\]"
reset="\[\e[m\]"

if [ $STY ]; then
    screen="${red}( #$STY )"
else
    screen=""
fi

userpart="╭─${debian_chroot:+($debian_chroot)}${whiteback}${sep1} \u "
hostpart="${whitetocyan}${sep1}${cyanback} \h ${sep2}${reset}"
git="${yellow}\$(parse_git_branch)${reset}"
venv="\$(virtualenv_info)";
path="${green}\w${reset}"
prompt="╰──╼ ${red}</>${reset} "

export PS1="${userpart} ${hostpart} ${screen} ${git} ${venv} ${path}\n${prompt}"



# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac



# Aliases
alias ww="~/bin/screen-wotts"
alias perldork='perldoc'
alias please='sudo $(fc -ln -1)'
alias open='xdg-open'
alias maak='make'
alias yeet='rm -rf'
alias vimall='vim -p $(git status --porcelain | awk '\''{print $2}'\'')'
alias settings='env XDG_CURRENT_DESKTOP=GNOME gnome-control-center'
alias pipes='pipes.sh -p 4 -r 10000 -c 1 -c 2 -c 3 -c 4 -c 5 -c 6 -c 7'

alias ls='ls --color=auto'
alias ll='ls -alF --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# eza aliases
alias els='eza --long --all --all --header --modified --git --classify --sort=name'
alias ezatree='eza --long --all --header --modified --git --classify --tree --sort=name'

docker-remove-all() {
  docker system prune --volumes --force
  docker rm $(docker ps -a -q)
  docker rmi -f $(docker images -qa)
}
