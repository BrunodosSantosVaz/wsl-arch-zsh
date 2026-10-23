# Arch Linux (WSL) prompt: replaces /usr/share/zsh/biglinux-zsh-prompt.
# Powerlevel10k with the Arch palette (arch/p10k.zsh) is the default when the theme is
# installed (./install-p10k.sh); otherwise Starship with arch/starship.toml.
# BIG_ZSH_PROMPT=starship|p10k forces one of them. ~/.p10k.zsh (from `p10k configure`)
# takes precedence over the bundled arch/p10k.zsh.
big_zsh_p10k=${XDG_DATA_HOME:-$HOME/.local/share}/powerlevel10k/powerlevel10k.zsh-theme
case ${BIG_ZSH_PROMPT:-auto} in
    p10k)     big_zsh_use=p10k ;;
    starship) big_zsh_use=starship ;;
    *)        [[ -r $big_zsh_p10k ]] && big_zsh_use=p10k || big_zsh_use=starship ;;
esac

if [[ $big_zsh_use == p10k && -r $big_zsh_p10k ]]; then
    source "$big_zsh_p10k"
    big_zsh_p10k_config=${POWERLEVEL9K_CONFIG_FILE:-$HOME/.p10k.zsh}
    [[ -r $big_zsh_p10k_config ]] || big_zsh_p10k_config=$BIG_ZSH_DIR/arch/p10k.zsh
    [[ -r $big_zsh_p10k_config ]] && source "$big_zsh_p10k_config"
elif command -v starship >/dev/null 2>&1; then
    export STARSHIP_CONFIG=${STARSHIP_CONFIG:-${BIG_ZSH_DIR}/arch/starship.toml}
    eval "$(starship init zsh)"
else
    PROMPT='%F{#1793D1}%B%n@%m%b%f %F{#5EC4F5}%~%f %F{#1793D1}❯%f '
fi
unset big_zsh_p10k big_zsh_use big_zsh_p10k_config
