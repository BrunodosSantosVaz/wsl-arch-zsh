#!/usr/bin/env bash
set -Eeuo pipefail

project_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

if [[ ! -r /etc/os-release ]]; then
    printf 'Não foi possível identificar o sistema.\n' >&2
    exit 1
fi
# shellcheck disable=SC1091
source /etc/os-release
case "${ID:-}" in
    arch)
        # Arch Linux (inclui WSL): usa a camada própria em arch/.
        ;;
    biglinux)
        for required_file in /usr/share/zsh/biglinux-zsh-config /usr/share/zsh/biglinux-zsh-prompt; do
            if [[ ! -r "$required_file" ]]; then
                printf 'Arquivo oficial do BigLinux não encontrado: %s\n' "$required_file" >&2
                exit 1
            fi
        done
        ;;
    *)
        printf 'Este instalador é exclusivo para Arch Linux/BigLinux (sistema detectado: %s).\n' "${PRETTY_NAME:-desconhecido}" >&2
        exit 1
        ;;
esac

packages=(zsh eza bat ripgrep fd dust duf procs hyperfine fzf zoxide git-delta lazygit libqalculate lsof unzip p7zip mise grc)
if [[ "${ID:-}" == arch ]]; then
    packages+=(starship zsh-autosuggestions zsh-syntax-highlighting zsh-completions zsh-history-substring-search)
fi

missing=()
for package in "${packages[@]}"; do
    pacman -Q "$package" >/dev/null 2>&1 || missing+=("$package")
done

if (( ${#missing[@]} )); then
    printf 'Pacotes que serão instalados dos repositórios configurados:\n  %s\n' "${missing[*]}"
    if (( EUID == 0 )); then
        pacman -S --needed "${missing[@]}"
    else
        sudo pacman -S --needed "${missing[@]}"
    fi
else
    printf 'Todas as dependências já estão instaladas.\n'
fi

"$project_dir/setup-zshrc.sh"
printf '\nInstalação concluída. Teste com: zsh\n'
printf 'Para tornar o Zsh padrão depois do teste: chsh -s "$(command -v zsh)"\n'
