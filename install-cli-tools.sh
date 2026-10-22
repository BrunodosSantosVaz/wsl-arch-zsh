#!/usr/bin/env bash
set -Eeuo pipefail

printf 'Este script é um atalho para o instalador principal.\n'
exec "$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)/install-deps.sh"
