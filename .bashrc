#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
export EDITOR=nvim
export HISTFILE=${HOME}/.local/state/bash/bash_history
export INPUTRC=${HOME}/.config/readline/inputrc 


alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias la='ls -la --color=auto'

if [ -d "$HOME/.local/bin/" ]; then
    export PATH="$HOME/.local/bin/:$PATH"
fi

PS1='[\[\e[35m\]\u\[\e[0m\]@\[\e[38;5;214m\]\h\[\e[0m\]][\[\e[38;5;69m\]\w\[\e[0m\]]\\$ '
