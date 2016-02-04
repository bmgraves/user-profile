#################
# bmgraves .zshrc
#################
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
        export TERM='xterm-256color'
else
        export TERM='xterm-color'
fi

PATH=/bin:/usr/local/bin:/usr/bin:$HOME:/usr/local/sbin:/usr/sbin
# Set cmdline history
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# Antigen plugin manager:
source /home/bmgraves/Documents/antigen/antigen.zsh
#
## PLUGINS
## Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply


# MISC Features
# bindkey -v enables VI like editiing features on the cmdline
bindkey -e

# Completion system, I dont currently understand these,
# from the default
zstyle :compinstall filename '/home/bmgraves/.zshrc'
autoload -Uz compinit
compinit

# User Prompt
# PROMPT=
# First we enable colors for the prompt
autoload -U colors
colors
## next se tthe prompt
PROMPT="%{$fg[red]%}[%{$fg[blue]%}%n%{$reset_color%}@%{$fg[cyan]%}%m %{$fg[red]%}]%{$fg_no_bold[yellow]%}%1~ %{$reset_color%}%# "
