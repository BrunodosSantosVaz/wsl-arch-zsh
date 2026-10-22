# GRC wrapping is opt-in because wrappers can change command behavior.
# Works with grc-rs when installed, otherwise with the classic Arch `grc` package.
if [[ ${BIG_ZSH_ENABLE_GRC:-0} == 1 ]]; then
    big_zsh_grc=${commands[grc-rs]:-${commands[grc]:-}}
    if [[ -n $big_zsh_grc ]]; then
        for big_zsh_grc_command in ping traceroute ip ss diff; do
            command -v "$big_zsh_grc_command" >/dev/null 2>&1 &&
                alias "$big_zsh_grc_command=${big_zsh_grc:t} $big_zsh_grc_command"
        done
    fi
    unset big_zsh_grc big_zsh_grc_command
fi
