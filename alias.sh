alias py="python3"
alias pong="ping gentoo.org"
alias trm="trash-put"
alias lg="lazygit"
alias cdtemp="cd \$(mktemp -d)"
alias neofetch="fastfetch -c neofetch"

alias adamimprojevarmiya="cd ~/Projects/; ls -l"

# clear
alias c="clear"

# ls
alias ls="/usr/bin/exa"
alias l="ls -l"
alias la="ls -la"
alias tree="ls --tree"

# tools
alias r="ranger"
alias e="nvim"
alias se="sudo -E nvim"
alias sr="sudo -E ranger"

# emerge
alias emerge="sudo -E emerge"
alias E="emerge --verbose-conflicts --verbose --ask"
# alias E="emerge"
alias Eun="E --unmerge"
alias Ep="E --prune"
alias Ei="E --info"
alias Es="E --sync"
alias Ese="E --search"
alias Esd="E --searchdesc"
alias Eu="E --update --newuse --deep"
alias Ec="E --depclean --deep"
alias Ed="E --deselect"

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
alias dcomp="docker compose"
alias dlogs="docker logs -f"

# iwctl
alias wifi="iwctl station wlan0"

# ifconfig.me
alias myip="curl ifconfig.me/ip"
alias ifconfig.me="curl ifconfig.me/all"
