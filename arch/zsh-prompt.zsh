# Arch Linux (WSL) prompt: replaces /usr/share/zsh/biglinux-zsh-prompt.
# BIG_ZSH_PROMPT=starship|p10k selects the prompt; by default Powerlevel10k is used
# when installed (./install-p10k.sh), otherwise Starship with arch/starship.toml.
big_zsh_p10k=${XDG_DATA_HOME:-$HOME/.local/share}/powerlevel10k/powerlevel10k.zsh-theme
case ${BIG_ZSH_PROMPT:-auto} in
    p10k)     big_zsh_use=p10k ;;
    starship) big_zsh_use=starship ;;
    *)        [[ -r $big_zsh_p10k ]] && big_zsh_use=p10k || big_zsh_use=starship ;;
esac

if [[ $big_zsh_use == p10k && -r $big_zsh_p10k ]]; then
    source "$big_zsh_p10k"
    [[ -r ${POWERLEVEL9K_CONFIG_FILE:-$HOME/.p10k.zsh} ]] && source "${POWERLEVEL9K_CONFIG_FILE:-$HOME/.p10k.zsh}"
elif command -v starship >/dev/null 2>&1; then
    export STARSHIP_CONFIG=${STARSHIP_CONFIG:-${BIG_ZSH_DIR}/arch/starship.toml}
    eval "$(starship init zsh)"
else
    PROMPT='%F{#1793D1}%B%n@%m%b%f %F{#5EC4F5}%~%f %F{#1793D1}❯%f '
fi
unset big_zsh_p10k big_zsh_use
