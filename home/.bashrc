# ~/.bashrc: executed by bash(1) for non-login shells.

# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;; *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi
#export PS1="[\[\e[01;32m\]\w[\em\]]>\[$(tput sgr0)\]"
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

git_status() {
    local STATUS=$(git status -s 2> /dev/null)
    local ADDED=$(echo "$STATUS" | grep '??' | wc -l)
    local DELETED=$(echo "$STATUS" | grep ' D' | wc -l)
    local MODIFIED=$(echo "$STATUS" | grep ' M' | wc -l)
    local STATS=''

    if [ $ADDED != 0 ]; then
        STATS="A: $ADDED"
    fi

    if [ $DELETED != 0 ]; then
        STATS="$STATS D: $DELETED"
    fi

    if [ $MODIFIED != 0 ]; then
        STATS="$STATS M: $MODIFIED"
    fi
    echo "$STATS"
}
#export PS1="[\[\e[33;40m\]\w\[\e[m\]] \[\e[91m\]\$(parse_git_branch)\[\e[00m\]>"

# Prompt
RED="\[\e[31m\]"
GREEN="\[\e[32m\]"
YELLOW="\[\e[33m\]"
YELLOW_BG="\[\e[30;103m\]"
RESET="\[\e[39m\]"
RESET_BG="\[\e[0m\]"
BLUE_BG="\[\e[30;44m\]"
__PS1_GIT=${YELLOW_BG}'`__git_ps1`'
__PS1_STATS='`git_status`'
#export PS1="$BLUE_BG[\w] $YELLOW_BG\$(parse_git_branch)$RESET_BG>"
#export PS1="$BLUE_BG \w $YELLOW_BG $(__git_ps1) $RESET_BG>"
export PS1="${BLUE_BG} \w ${__PS1_GIT}${__PS1_STATS}${RESET_BG}>"



# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


export PATH_GCCARM=/home/marcel/SimplicityStudio_v5/developer/toolchains/gnu_arm/12.2.rel1_2023.7/
export PATH_SCMD=/home/marcel/SimplicityStudio_v5/developer/adapter_packs/commander
export SIMPLICITY_SDK_PATH=/home/marcel/SimplicityStudio/SDKs/simplicity_sdk
export PATH=/home/marcel/Downloads/android_studio/bin:$PATH
export PATH=/home/marcel/.local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH="$PATH:$(go env GOPATH)/bin"
export PATH=/home/marcel/pycharm/bin:$PATH
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
export PATH=~/.npm-global/bin:$PATH
export PATH=/home/marcel/Applications/nanopb/generator:$PATH
export PATH=$HOME/Applications/avr8-gnu-toolchain-linux_x86_64/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#personal aliasses
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export DENO_INSTALL="/home/marcel/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

. "$HOME/.cargo/env"


eval "$(uv generate-shell-completion bash)"