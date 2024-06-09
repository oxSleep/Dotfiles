#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=nvim
export HISTFILE=${HOME}/.local/state/bash/.bash_history
export INPUTRC=${HOME}/.config/readline/inputrc 


alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias la='ls -la --color=auto'

PS1='[\u@\h \W]\$ '
