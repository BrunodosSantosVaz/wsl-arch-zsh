# Arch Linux (WSL) prompt: replaces /usr/share/zsh/biglinux-zsh-prompt.
# Uses Starship with the Arch palette defined in arch/starship.toml.
if command -v starship >/dev/null 2>&1; then
    export STARSHIP_CONFIG=${STARSHIP_CONFIG:-${BIG_ZSH_DIR}/arch/starship.toml}
    eval "$(starship init zsh)"
else
    PROMPT='%F{#1793D1}%B%n@%m%b%f %F{#5EC4F5}%~%f %F{#1793D1}❯%f '
fi
