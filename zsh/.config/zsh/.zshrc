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
alias pacclean="sudo pacman -Rns $(pacman -Qdtq)"
alias cp="advcp -rvg"
alias mv="advmv -vg"
alias df="df -h"
alias free="free -h"
alias mci="sudo make clean install"
alias mc="make clean"
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

eval "$(starship init zsh)"
