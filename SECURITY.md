# Política de segurança

## Dados e credenciais

WSL Arch Zsh não requer tokens, chaves de API nem senhas armazenadas. O instalador chama `sudo` normalmente, permitindo que o próprio terminal faça a leitura segura da senha.

Nunca envie senha como argumento, variável versionada ou arquivo do projeto. Configurações locais devem ficar em `~/.config/big-zsh/local.zsh`.

## Instalação

O instalador:

- aceita somente Arch Linux (incluindo WSL) ou BigLinux;
- usa pacotes dos repositórios configurados no `pacman`;
- não executa scripts baixados por `curl | sh`;
- não muda o shell padrão automaticamente;
- cria backup antes de editar o `.zshrc`.

## Relato de vulnerabilidade

Não publique credenciais ou detalhes exploráveis em uma issue pública. Entre em contato com o mantenedor pelo recurso **Report a vulnerability** do GitHub, quando disponível.
