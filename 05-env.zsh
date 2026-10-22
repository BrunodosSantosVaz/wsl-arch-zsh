# Add user-local executables without replacing the PATH assembled by BigLinux.
typeset -U path PATH
path=("$HOME/.local/bin" "$HOME/bin" $path)
: ${EDITOR:=vim}
: ${VISUAL:=$EDITOR}
export EDITOR VISUAL
