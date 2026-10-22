# Compatibilidade

## Escopo

Big Zsh funciona no Arch Linux (incluindo WSL) com a camada própria em `arch/`, e no BigLinux reaproveitando a integração Zsh do sistema em `/usr/share/zsh`. Nada dessa integração é copiado.

## O que permanece intacto

- Bash, `~/.bashrc` e `/etc/bash.bashrc`;
- configuração e prompt Zsh oficiais do BigLinux;
- comandos tradicionais e suas opções;
- gerenciador de pacotes e atualizações do sistema.

Scripts executados por Bash continuam usando Bash por meio do shebang. Trocar o shell interativo padrão não muda o interpretador desses scripts.

## Limites honestos

Bash e Zsh possuem sintaxe, opções, builtins e sistemas de completion diferentes. Por isso, “nenhuma funcionalidade perdida” significa que o ambiente Bash original não é removido e continua acessível — não que todo código Bash possa ser colado em Zsh sem adaptação.

O projeto não promete compatibilidade com outras distribuições. O instalador valida `ID=arch` ou `ID=biglinux` antes de modificar o `.zshrc`.

## Recuperação

O instalador cria um backup datado do `.zshrc`. Para remover somente a integração:

```bash
./uninstall.sh
```

Também é possível iniciar o Bash original com:

```bash
exec bash -l
```
