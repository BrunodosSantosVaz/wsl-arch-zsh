#!/usr/bin/env bash
set -u

project_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
failures=0

check() {
    local description=$1
    shift
    if "$@" >/dev/null 2>&1; then
        printf '✓ %s\n' "$description"
    else
        printf '✗ %s\n' "$description"
        failures=$((failures + 1))
    fi
}

check 'Sintaxe Bash dos scripts' bash -n "$project_dir/install-deps.sh" "$project_dir/install-cli-tools.sh" "$project_dir/install-p10k.sh" "$project_dir/setup-zshrc.sh" "$project_dir/uninstall.sh" "$project_dir/test-setup.sh"
check 'Sintaxe Zsh dos módulos' zsh -n "$project_dir/big-zsh.zsh" "$project_dir"/[0-9][0-9]-*.zsh
check 'Sintaxe Zsh da camada Arch' zsh -n "$project_dir"/arch/*.zsh
check 'Carregamento isolado' zsh -dfc "source '$project_dir/big-zsh.zsh'"
check 'Starship aceita a configuração' env STARSHIP_CONFIG="$project_dir/arch/starship.toml" starship prompt

if (( failures )); then
    printf '\n%d verificação(ões) falharam.\n' "$failures" >&2
    exit 1
fi
printf '\nTodas as verificações passaram.\n'
