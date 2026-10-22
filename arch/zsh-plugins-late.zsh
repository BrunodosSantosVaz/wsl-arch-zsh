# Must be sourced after every other module (syntax-highlighting wraps ZLE widgets).
_big_zsh_plugin=/usr/share/zsh/plugins
if [[ -r $_big_zsh_plugin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source $_big_zsh_plugin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    typeset -A ZSH_HIGHLIGHT_STYLES
    ZSH_HIGHLIGHT_STYLES[command]='fg=#1793D1,bold'
    ZSH_HIGHLIGHT_STYLES[builtin]='fg=#1793D1'
    ZSH_HIGHLIGHT_STYLES[alias]='fg=#5EC4F5,bold'
    ZSH_HIGHLIGHT_STYLES[function]='fg=#5EC4F5'
    ZSH_HIGHLIGHT_STYLES[path]='fg=#ffffff,underline'
    ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#d1393d'
    ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#e5c07b'
    ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#e5c07b'
fi
unset _big_zsh_plugin
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#5c6b78'
