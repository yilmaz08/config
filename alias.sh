alias py="python3"
alias pong="ping archlinux.org"
alias trm="trash-put"

alias adamimprojevarmiya="cd ~/Projects/; ls -l"

# clear
alias c="clear"
alias clr="clear"
alias cls="clear"

# fetch
alias nf="neofetch"
alias ff="fastfetch"
alias fetch="ff -c examples/13"

# ls
alias ls="/usr/bin/exa"
alias l="ls -l"
alias la="ls -la"

# tools
alias r="ranger"
alias e="nvim"
alias se="sudo nvim"
alias sr="sudo ranger"

# aur helper
alias aur="yay" # change this alias to affect all
alias S="aur -S"
alias Ss="aur -Ss"
alias Si="aur -Si"
alias Syu="aur -Syu"
alias Syyu="aur -Syyu"
alias R="aur -R"
alias Rcns="aur -Rcns"
alias Q="aur -Q"
alias Qe="aur -Qe"
alias Su="aur -Su"
alias Fy="aur -Fy"
alias F="aur -F"

# systemctl
alias sstart="sudo systemctl start"
alias srestart="sudo systemctl restart"
alias sreload="sudo systemctl reload"
alias sstop="sudo systemctl stop"
alias senable="sudo systemctl enable"
alias sdisable="sudo systemctl disable"
alias sstatus="sudo systemctl status"

# bluetoothctl
alias btrust="bluetoothctl trust"
alias bpair="bluetoothctl pair"
alias bconn="bluetoothctl connect"
alias bdisconn="bluetoothctl disconnect"
alias bpower="bluetoothctl power"
alias bscan="bluetoothctl scan"
alias bdev="bluetoothctl devices"
alias bctl="bluetoothctl"

# docker
alias drun="docker run"
alias dattach="docker attach"
alias dpull="docker pull"
alias dstop="docker stop"
alias dstart="docker start"
alias drestart="docker restart"
alias drm="docker rm"
alias dexec="docker exec"
alias dps="docker ps"
alias dcompose="docker compose"

# ifconfig.me
alias myip="curl ifconfig.me/ip"
alias ifconfig.me="curl ifconfig.me/all"
