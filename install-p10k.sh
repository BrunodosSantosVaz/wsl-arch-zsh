#!/usr/bin/env bash
set -Eeuo pipefail

# Instala o Powerlevel10k (opcional) para usar `p10k configure` no lugar do Starship.
# O tema não está nos repositórios oficiais do Arch; o autor recomenda clonar o repositório.
version=v1.20.0
target="${XDG_DATA_HOME:-$HOME/.local/share}/powerlevel10k"

if [[ -d "$target/.git" ]]; then
    printf 'Powerlevel10k já está em %s\n' "$target"
else
    mkdir -p -- "$(dirname -- "$target")"
    git clone --depth=1 --branch "$version" https://github.com/romkatv/powerlevel10k.git "$target"
fi
printf '\nPronto. Abra uma nova sessão (exec zsh). Para refazer o visual: p10k configure\n'
printf 'Para voltar ao Starship: export BIG_ZSH_PROMPT=starship em ~/.config/big-zsh/local.zsh\n'
