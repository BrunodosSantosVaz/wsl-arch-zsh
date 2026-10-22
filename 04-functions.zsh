mkcd() {
    if (( $# != 1 )); then
        print -u2 'uso: mkcd DIRETÓRIO'
        return 2
    fi
    mkdir -p -- "$1" && cd -- "$1"
}

backup() {
    if (( $# != 1 )) || [[ ! -e "$1" ]]; then
        print -u2 'uso: backup ARQUIVO_OU_DIRETÓRIO'
        return 2
    fi
    cp -a -- "$1" "$1.backup-$(date +%Y%m%d-%H%M%S)"
}

killport() {
    if (( $# != 1 )) || [[ "$1" != <1-65535> ]]; then
        print -u2 'uso: killport PORTA'
        return 2
    fi
    local -a pids
    pids=(${(f)"$(lsof -tiTCP:"$1" -sTCP:LISTEN 2>/dev/null)"})
    if (( ${#pids} == 0 )); then
        print -u2 "nenhum processo escutando na porta $1"
        return 1
    fi
    kill -- "$pids[@]"
}

extract() {
    if (( $# != 1 )) || [[ ! -f "$1" ]]; then
        print -u2 'uso: extract ARQUIVO'
        return 2
    fi
    case "$1" in
        *.tar.bz2|*.tbz2) tar -xjf "$1" ;;
        *.tar.gz|*.tgz)   tar -xzf "$1" ;;
        *.tar.xz|*.txz)   tar -xJf "$1" ;;
        *.tar)            tar -xf "$1" ;;
        *.bz2)            bunzip2 -- "$1" ;;
        *.gz)             gunzip -- "$1" ;;
        *.zip)            unzip -- "$1" ;;
        *.7z)             7z x -- "$1" ;;
        *.rar)            unrar x -- "$1" ;;
        *) print -u2 "formato não reconhecido: $1"; return 1 ;;
    esac
}

command -v qalc >/dev/null 2>&1 && function '=' { qalc "$@"; }

if command -v bat >/dev/null 2>&1; then
    h() {
        if (( $# == 0 )); then
            print -u2 'uso: h COMANDO'
            return 2
        fi
        if (( $+builtins[$1] )); then
            run-help "$1" 2>&1 | bat --paging=never --style=plain --language=help
        else
            command "$@" --help 2>&1 | bat --paging=never --style=plain --language=help
        fi
    }
    (( $+functions[compdef] )) && compdef _command h
fi
