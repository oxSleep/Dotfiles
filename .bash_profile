#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export XDG_CONFIG_HOME=${HOME}/.config
export XDG_CACHE_HOME=${HOME}/.cache
export XDG_DATA_HOME=${HOME}/.local/share
export XDG_STATE_HOME=${HOME}/.local/state
export XDG_DATA_DIRS="/usr/local/share:/usr/share"

export WINEPREFIX=${XDG_DATA_HOME}/wine/default/
export GNUPGHOME=${XDG_DATA_HOME}/gnupg
export CUDA_CACHE_PATH=${XDG_CACHE_HOME}/nv
export XCURSOR_PATH=${XDG_DATA_HOME}/icons
export XAUTHORITY=${XDG_RUNTIME_DIR}/Xauthority
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc


if [[ -d "${HOME}/.local/dev/rust" && ! "$PATH" == *"${HOME}/.local/dev/rust"* ]];
then
  export RUSTUP_HOME="${HOME}/.local/dev/rust/.rustup"
  export CARGO_HOME="${HOME}/.local/dev/rust/.cargo"
  PATH="${PATH}:${CARGO_HOME}/bin"
fi

