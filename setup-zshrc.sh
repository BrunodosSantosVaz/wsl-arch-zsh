#!/usr/bin/env bash
set -Eeuo pipefail

project_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
zshrc="$HOME/.zshrc"
start_marker='# >>> big-zsh >>>'
end_marker='# <<< big-zsh <<<'

if [[ ! -r "$project_dir/big-zsh.zsh" ]]; then
    printf 'Entrada do projeto não encontrada: %s\n' "$project_dir/big-zsh.zsh" >&2
    exit 1
fi

touch "$zshrc"
if grep -Fq "$start_marker" "$zshrc"; then
    printf 'Big Zsh já está configurado em %s.\n' "$zshrc"
    exit 0
fi

backup="$zshrc.backup-$(date +%Y%m%d-%H%M%S)"
cp -a -- "$zshrc" "$backup"
{
    printf '\n%s\n' "$start_marker"
    printf 'source %q\n' "$project_dir/big-zsh.zsh"
    printf '%s\n' "$end_marker"
} >> "$zshrc"

printf 'Configuração adicionada a %s.\nBackup: %s\n' "$zshrc" "$backup"
