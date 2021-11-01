# ~/.bashrc
# This file contains settings for the interactive shell.
# It is sourced by ~/.bash_profile

[[ "$-" != *i* ]] && return

PS1='\[\e[31m\]\u\[\e[37m\]@\[\e[31m\]\h \[\e[33m\]\W \[\e[90m\]λ \[\e[39m\]'

HISTFILESIZE=10000
HISTCONTROL='erasedups'
PROMPT_COMMAND='history -a'

shopt -s histappend
shopt -s autocd

[[ -f "$HOME"/.variables ]] && . "$HOME"/.variables
[[ -f "$HOME"/.aliases ]] && . "$HOME"/.aliases
[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"

clean_bash_history
