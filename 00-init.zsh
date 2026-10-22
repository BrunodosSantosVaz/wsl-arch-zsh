# Small additions that do not replace BigLinux defaults.
setopt HIST_EXPIRE_DUPS_FIRST HIST_IGNORE_SPACE PUSHD_IGNORE_DUPS PUSHD_SILENT
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

[[ -r /usr/share/fzf/key-bindings.zsh ]] && source /usr/share/fzf/key-bindings.zsh
[[ -r /usr/share/fzf/completion.zsh ]] && source /usr/share/fzf/completion.zsh
