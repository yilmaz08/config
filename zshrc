# Ranger
rangercd() {
    tempfile="$(mktemp)"
    ranger --choosedir="$tempfile" "${@:-$PWD}"
    if [ -f "$tempfile" ] && [ "$(cat "$tempfile")" != "$(pwd)" ]; then
        cd "$(cat "$tempfile")"
    fi
    rm -f "$tempfile"
}

# Alias
alias cd=z
alias cdi=zi
source ~/.config/alias.sh

# Widgets
editor() {
	nvim ./
	zle reset-prompt
}
zle -N editor

# Bindings
bindkey "^[[3~" delete-char # Delete
bindkey '^[[1;5A' history-substring-search-up # Ctrl+Up
bindkey '^[[1;5B' history-substring-search-down # Ctrl+Down
bindkey '^[[1;5C' forward-word # Ctrl+Right
bindkey '^[[1;5D' backward-word # Ctrl+Left
bindkey '^[[F' end-of-line # End
bindkey '^[[H' beginning-of-line # Home
bindkey '^H' beginning-of-line # Ctrl+H
bindkey '^[[5~' history-search-backward # Page Up
bindkey '^[[6~' history-search-forward # Page Down
bindkey '^E' editor # Ctrl+E

# Extensions
source ~/.config/zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh_plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.config/zsh_plugins/zsh-autoswitch-virtualenv/autoswitch_virtualenv.plugin.zsh
source ~/.config/zsh_plugins/ohmyzsh-sudo/sudo.plugin.zsh

# Completions
autoload -Uz compinit
compinit

# History
HISTFILE=~/.config/zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt APPEND_HISTORY # Append history instead of overwriting
setopt HIST_IGNORE_DUPS	# Ignore duplicate commands
setopt HIST_IGNORE_ALL_DUPS	# Remove older duplicate commands
setopt INC_APPEND_HISTORY_TIME # Write history incrementally

# Other
eval "$(zoxide init zsh)" # Advanced cd
eval "$(starship init zsh)" # Shell prompt
