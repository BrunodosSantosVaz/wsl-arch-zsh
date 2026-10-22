# BigLinux provides the prompt and core Zsh plugins.
command -v mise >/dev/null 2>&1 && eval "$(mise activate zsh)"
command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init zsh --cmd z)"
