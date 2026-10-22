# Arch Linux (WSL) base: replaces /usr/share/zsh/biglinux-zsh-config.
# Provides history, completion, Zsh plugins and terminal title/cwd reporting.

# History
HISTFILE=${HISTFILE:-$HOME/.zsh_history}
HISTSIZE=50000
SAVEHIST=50000
setopt APPEND_HISTORY SHARE_HISTORY HIST_IGNORE_DUPS HIST_REDUCE_BLANKS EXTENDED_HISTORY
setopt AUTO_CD INTERACTIVE_COMMENTS NO_BEEP

# Completion (zsh-completions adds extra definitions)
[[ -d /usr/share/zsh/site-functions ]] && fpath=(/usr/share/zsh/site-functions $fpath)
[[ -d /usr/share/zsh/plugins/zsh-completions/src ]] && fpath=(/usr/share/zsh/plugins/zsh-completions/src $fpath)
autoload -Uz compinit
compinit -d "${XDG_CACHE_HOME:-$HOME/.cache}/zcompdump"
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:descriptions' format '%F{blue}%B-- %d --%b%f'

# Terminal title and working-directory reporting.
# OSC 9;9 is understood by Windows Terminal (duplicate tab / split pane in same dir).
mzc_termsupport_precmd() {
    [[ -t 1 ]] || return 0
    print -Pn '\e]0;%n@%m: %~\a'
    if [[ -n ${WSL_DISTRO_NAME:-} ]] && command -v wslpath >/dev/null 2>&1; then
        print -n "\e]9;9;$(wslpath -w "$PWD" 2>/dev/null)\e\\"
    fi
}
autoload -Uz add-zsh-hook
add-zsh-hook precmd mzc_termsupport_precmd

# Plugins. Order matters: syntax-highlighting must be sourced last,
# so it is loaded by arch/zsh-plugins-late.zsh after all modules.
_big_zsh_plugin=/usr/share/zsh/plugins
[[ -r $_big_zsh_plugin/zsh-autosuggestions/zsh-autosuggestions.zsh ]] &&
    source $_big_zsh_plugin/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -r $_big_zsh_plugin/zsh-history-substring-search/zsh-history-substring-search.zsh ]] &&
    source $_big_zsh_plugin/zsh-history-substring-search/zsh-history-substring-search.zsh
unset _big_zsh_plugin

# Arrow keys search history by what is already typed.
if (( $+functions[history-substring-search-up] )); then
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
    bindkey '^[OA' history-substring-search-up
    bindkey '^[OB' history-substring-search-down
fi
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
