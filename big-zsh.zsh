# Entry point for Big Zsh. This file must be sourced by Zsh.
if [[ -n ${BIG_ZSH_LOADED:-} ]]; then
    return 0
fi
typeset -g BIG_ZSH_LOADED=1
typeset -g BIG_ZSH_DIR=${${(%):-%N}:A:h}

# Base layer: BigLinux files when present, otherwise the bundled Arch Linux layer.
if [[ -z ${functions[mzc_termsupport_precmd]:-} ]]; then
    if [[ -r /usr/share/zsh/biglinux-zsh-config ]]; then
        source /usr/share/zsh/biglinux-zsh-config
    else
        source "$BIG_ZSH_DIR/arch/zsh-config.zsh"
    fi
fi
if [[ -z ${functions[prompt_powerlevel10k_setup]:-} && -z ${POWERLEVEL9K_LEFT_PROMPT_ELEMENTS+x} ]]; then
    if [[ -r /usr/share/zsh/biglinux-zsh-prompt ]]; then
        source /usr/share/zsh/biglinux-zsh-prompt
    else
        source "$BIG_ZSH_DIR/arch/zsh-prompt.zsh"
    fi
fi

for big_zsh_module in "$BIG_ZSH_DIR"/[0-9][0-9]-*.zsh(N); do
    source "$big_zsh_module"
done
unset big_zsh_module

# Syntax highlighting must come after every widget is defined.
[[ -r "$BIG_ZSH_DIR/arch/zsh-plugins-late.zsh" && ! -r /usr/share/zsh/biglinux-zsh-config ]] &&
    source "$BIG_ZSH_DIR/arch/zsh-plugins-late.zsh"

[[ -r "${XDG_CONFIG_HOME:-$HOME/.config}/big-zsh/local.zsh" ]] &&
    source "${XDG_CONFIG_HOME:-$HOME/.config}/big-zsh/local.zsh"

return 0
