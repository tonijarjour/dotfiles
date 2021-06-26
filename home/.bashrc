# ~/.bashrc
# This file contains settings for the interactive shell.
# It is sourced by ~/.bash_profile

[[ "$-" != *i* ]] && return

PS1='\[\e[36m\]\u\[\e[37m\]@\[\e[36m\]\h \[\e[33m\]\W \[\e[90m\]λ \[\e[39m\]'

HISTFILESIZE=10000
HISTCONTROL='erasedups'
PROMPT_COMMAND='history -a'

shopt -s histappend
shopt -s autocd

[[ -f "$HOME"/.variables ]] && . "$HOME"/.variables
[[ -f "$HOME"/.aliases ]] && . "$HOME"/.aliases

[[ -f /usr/share/fzf/key-bindings.bash ]] && \
	. /usr/share/fzf/key-bindings.bash
[[ -f /usr/share/fzf/completion.bash ]] && \
	. /usr/share/fzf/completion.bash

clean_bash_history
