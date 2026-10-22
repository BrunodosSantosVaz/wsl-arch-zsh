# WSL integration: only active when running under Windows Subsystem for Linux.
[[ -n ${WSL_DISTRO_NAME:-} ]] || return 0

alias open='explorer.exe'
alias clip='clip.exe'
alias pbcopy='clip.exe'
alias pbpaste='powershell.exe -NoProfile -Command Get-Clipboard'
alias winhome='cd "$(wslpath "$(cmd.exe /c "echo %USERPROFILE%" 2>/dev/null | tr -d "\r")")"'

# Open a file or directory with the Windows default app (default: current dir).
winopen() { explorer.exe "$(wslpath -w "${1:-.}")"; }
