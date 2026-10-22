# Familiar Emacs-style editing without changing BigLinux's arrow-key bindings.
bindkey -e
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line
