#!/usr/bin/env bash
set -Eeuo pipefail

zshrc="$HOME/.zshrc"
[[ -f "$zshrc" ]] || exit 0
backup="$zshrc.backup-$(date +%Y%m%d-%H%M%S)"
cp -a -- "$zshrc" "$backup"

temporary="$(mktemp)"
awk '
    $0 == "# >>> big-zsh >>>" { managed = 1; next }
    $0 == "# <<< big-zsh <<<" { managed = 0; next }
    !managed { print }
' "$zshrc" > "$temporary"
install -m 600 "$temporary" "$zshrc"
rm -f -- "$temporary"
printf 'Bloco Big Zsh removido. Backup: %s\n' "$backup"
