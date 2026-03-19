plugins=(virtualenv)

# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
autoload -Uz listColors		# Enable colored ls output

# Enhanced LS_COLORS with muted colors for hidden files and more file types
LS_COLORS='di=1;34:ln=1;36:or=41;33:mi=41;33:so=1;35:bd=1;33:cd=1;33:pi=1;33:sg=1;37:tw=1;37:ow=1;37:st=1;37:ex=1;32:*.tar=1;31:*.tgz=1;31:*.rar=1;31:*.zip=1;31:*.gz=1;31:*.bz2=1;31:*.7z=1;31:*.xz=1;31:*.zst=1;31:*.jpg=1;35:*.jpeg=1;35:*.png=1;35:*.gif=1;35:*.bmp=1;35:*.svg=1;35:*.ico=1;35:*.webp=1;35:*.tiff=1;35:*.xcf=1;35:*.pdf=1;33:*.doc=1;33:*.docx=1;33:*.xls=1;33:*.xlsx=1;33:*.ppt=1;33:*.pptx=1;*.odt=1;33:*.ods=1;33:*.odp=1;33:*.txt=0;37:*.log=0;90:*.html=1;33:*.htm=1;33:*.css=1;36:*.scss=1;36:*.less=1;36:*.sass=1;36:*.js=1;36:*.ts=1;36:*.jsx=1;36:*.tsx=1;36:*.mjs=1;36:*.cjs=1;36:*.py=1;32:*.pyc=1;32:*.pyo=1;32:*.rb=1;32:*.go=1;32:*.rs=1;32:*.sh=1;32:*.bash=1;32:*.zsh=1;32:*.fish=1;32:*.ksh=1;32:*.c=1;32:*.h=1;32:*.cpp=1;32:*.hpp=1;32:*.cc=1;32:*.hh=1;32:*.cxx=1;32:*.hxx=1;32:*.java=1;32:*.kt=1;32:*.scala=1;32:*.groovy=1;32:*.php=1;32:*.swift=1;32:*.md=1;37:*.rst=1;37:*.adoc=1;37:*.org=1;37:*.json=1;36:*.xml=1;33:*.yaml=1;36:*.yml=1;36:*.toml=1;36:*.ini=1;36:*.cfg=1;36:*.conf=1;36:Makefile=1;33:makefile=1;33:*.mk=1;33:'
export LS_COLORS

# Initialize dircolors if available, otherwise use LS_COLORS
if command -v dircolors >/dev/null 2>&1; then
    eval "$(dircolors -b 2>/dev/null)" || true
fi
# Set muted color for hidden files in ls output
# di=directory, fi=file, so=socket, bd=block device, cd=char device, or=orphan, mi=missing
# Hidden files (.*): using bright black/gray (90) for muted appearance
export LSCOLORS='gxfxexexhxgexexexexxcxcxdxdx'  # BSD-style fallback

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

# Set up colored completion with muted colors for hidden files
# This makes hidden files appear in gray during tab completion
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
_comp_options+=(globdots)		# Include hidden files.

# Add alias for ls with colors always enabled
alias ls='ls --color=auto'
alias l='ls -la --color=auto'
alias ll='ls -l --color=auto'

source $XDG_CONFIG_HOME/aliases

export PATH="$HOME/.opencode/bin:$PATH"
