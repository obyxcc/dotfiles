# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000

# Aliases
alias ls="ls -Ahl --color"
alias vim="nvim"
alias grep="grep --color=auto"
alias pacclean="paru -Rns $(pacman -Qdtq)"
alias pacup="paru -Syu && pkill -RTMIN+3 dwmblocks"
alias cp="advcp -rvg"
alias mv="advmv -vg"
alias df="df -h"
alias free="free -h"
alias mci="sudo make clean install"
alias mc="make clean"
alias wpr="sxiv -t $HOME/pics/wallpapers/*"
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Disable vim mode
bindkey -e

# launch starship prompt
eval "$(starship init zsh)"

# start tmux if we ssh into the box
if [[ -n "$PS1" ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_CONNECTION" ]]; then
    tmux attach-session -t $USER || tmux new-session -s $USER
fi

