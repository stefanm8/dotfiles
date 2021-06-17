eval "$(/opt/homebrew/bin/brew shellenv)"
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
export EDITOR='vim'
[[ $TERM != "screen" ]] && exec tmux
tmux source-file ./.tmux.conf
PROMPT=' '
prompt pure
