# Arch Linux visual identity: Arch blue #1793D1 across CLI tools.
export BAT_THEME=${BAT_THEME:-ansi}
export LESS=${LESS:--R}
export LESS_TERMCAP_md=$'\e[1;38;2;23;147;209m'   # bold -> Arch blue
export LESS_TERMCAP_us=$'\e[4;38;2;94;196;245m'   # underline -> light blue
export LESS_TERMCAP_so=$'\e[1;37;48;2;23;147;209m'
export LESS_TERMCAP_me=$'\e[0m' LESS_TERMCAP_ue=$'\e[0m' LESS_TERMCAP_se=$'\e[0m'
export GREP_COLORS='mt=1;38;2;23;147;209'

# Directories in Arch blue for ls, eza and completion.
export LS_COLORS="${LS_COLORS:-}:di=1;38;2;23;147;209:ln=38;2;94;196;245:ex=1;32"
export EZA_COLORS="${EZA_COLORS:-}:da=38;2;138;155;168:uu=38;2;94;196;245"

# fzf
export FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS:-} \
--height=40% --layout=reverse --border=rounded \
--color=fg:#d0d7de,bg:-1,hl:#1793D1,fg+:#ffffff,bg+:#0B6FA4,hl+:#5EC4F5 \
--color=info:#8A9BA8,prompt:#1793D1,pointer:#1793D1,marker:#5EC4F5,spinner:#1793D1,header:#8A9BA8,border:#1793D1"

# Colored pacman, if the user has not enabled it system-wide.
alias pacman='command pacman --color=auto'
