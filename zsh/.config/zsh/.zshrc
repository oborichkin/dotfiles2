plugins=(virtualenv)

# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.

bindkey "\e[1;5D" backward-word
bindkey "\e[1;5C" forward-word
bindkey "\e[3;5~" kill-word
bindkey "^H"    backward-kill-word
bindkey "\e[3~"   delete-char
bindkey "\e[H"    beginning-of-line
bindkey "\e[F"    end-of-line

# History in cache directory:
setopt hist_ignore_all_dups
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
bindkey '^R' history-incremental-search-backward

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

source $XDG_CONFIG_HOME/aliases
