alias py="python3"
alias pong="ping gentoo.org"
alias trm="trash-put"
alias lg="lazygit"
alias cdtemp="cd \$(mktemp -d)"
alias neofetch="fastfetch -c neofetch"
alias ..="cd .."

alias adamimprojevarmiya="cd ~/Projects/; ls -l"

# clear
alias c="clear"

# clipboard in terminal
alias xpaste="xsel --clipboard --output"
alias xcopy="xsel --clipboard"

# ls
alias ls="/usr/bin/eza"
alias l="ls -l"
alias la="ls -la"
alias tree="ls --tree"

# tools
alias r="rangercd"
alias e="nvim"
alias se="sudo -E nvim"
alias sr="sudo -E ranger"

# emerge
alias emerge="sudo -E emerge"
alias E="emerge --verbose-conflicts --verbose --ask"
alias Eun="E --unmerge"
alias Ep="E --prune"
alias Ei="E --info"
alias Es="E --sync"
alias Ese="E --search"
alias Esd="E --searchdesc"
alias Eu="E --update --newuse --deep"
alias Ec="E --depclean --deep"
alias Ed="E --deselect"
alias Er="E @preserved-rebuild"

# bluetoothctl
alias bctl="bluetoothctl"
alias btrust="bctl trust"
alias bpair="bctl pair"
alias bconn="bctl connect"
alias bdisconn="bctl disconnect"
alias bpower="bctl power"
alias bscan="bctl scan"
alias bdev="bctl devices"

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
