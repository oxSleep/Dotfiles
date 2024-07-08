#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
export EDITOR=nvim
export HISTSIZE=10000
export HISTCONTROL="ignoredups:ignoreboth"
export HISTFILE=${HOME}/.local/state/bash/bash_history
export INPUTRC=${HOME}/.config/readline/inputrc 
export DOTFILES=${HOME}/Brrrr/github/dotfiles/


alias ls='ls --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias la='ls -la --color=auto'

if [ -d "$HOME/.local/bin/" ]; then
    export PATH="$HOME/.local/bin/:$PATH"
fi

PS1='[\[\e[35m\]\u\[\e[0m\]@\[\e[38;5;214m\]\h\[\e[0m\]][\[\e[38;5;69m\]\w\[\e[0m\]]\\$ '
