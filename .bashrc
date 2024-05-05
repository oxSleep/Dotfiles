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

if [[ -d "${HOME}/.local/bin" && ! "$PATH" == *"${HOME}/.local/bin"* ]];
then
  export RUSTUP_HOME="${HOME}/.local/bin"
  export CARGO_HOME="${HOME}/.local/bin"
  PATH="${PATH}:${CARGO_HOME}/bin"
fi

PS1='[\u@\h \W]\$ '
