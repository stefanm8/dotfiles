export BASH_SILENCE_DEPRECATION_WARNING=1

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

HISTCONTROL=ignoreboth
HISTSIZE=
HISTFILESIZE=

shopt -s histappend
shopt -s checkwinsize


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


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

alias ls='ls --color'
export PS1='\$ '
export EDITOR='vim'

[[ $TERM != *"screen"* ]] && exec tmux
tmux source-file ~/.tmux.conf

export GOPATH="$HOME/go"
export PATH=$PATH:/usr/local/go/bin

git config --global pull.rebase true
git config --global user.name stefanm8

