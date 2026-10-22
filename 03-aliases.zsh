# Core commands retain their native behavior. Modern tools use distinct names.
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias g='git'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gs='git status -sb'
alias gd='git diff'
alias gl='git log --oneline --graph --decorate'
alias bash-native='exec bash -l'
alias reload-zsh='exec zsh'

if command -v eza >/dev/null 2>&1; then
    alias l='eza --icons=auto --group-directories-first'
    alias ll='eza --icons=auto --group-directories-first -l'
    alias la='eza --icons=auto --group-directories-first -la'
    alias lt='eza --tree --level=2 --icons=auto --group-directories-first'
fi
