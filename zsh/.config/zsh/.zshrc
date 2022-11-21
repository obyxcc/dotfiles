# Retinazer's config for the Zoomer Shell (forked from Luke Smith)
# https://github.com/retinazer/dots

# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
PS1="%B%{$fg[green]%}%1~%{$fg[blue]%} >%{$reset_color%}%b "
#PS1="%B%{$fg[blue]%}[%{$fg[green]%}%1~%{$fg[blue]%}]%{$reset_color%}%b "
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Aliases
alias ls="ls -Ahl --color"
alias vim="nvim"
alias v="nvim"
alias grep="grep --color=auto"
alias pacclean="sudo pacman -Rns $(pacman -Qdtq)"
alias pacsyu="sudo pacman -Syyu"
alias cp="cpg"
alias mv="mvg"
alias df="df -h"
alias mci="sudo make clean install"
alias mc="make clean"
alias serve="browser-sync start --server --files ."

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

bindkey '^[[P' delete-char

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

eval "$(starship init zsh)"
