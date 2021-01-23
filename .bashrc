alias ls='ls --color'
export PS1='\$ '
export EDITOR='vim'
[[ $TERM != "screen" ]] && exec tmux
tmux source-file ./.tmux.conf
