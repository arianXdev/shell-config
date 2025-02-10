# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="edvardm"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

HISTFILE=~/.cache/zsh_history

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    vi-mode
    zsh-autosuggestions
    zsh-syntax-highlighting
    git
    gh
)

export KEYTIMEOUT=1

source $ZSH/oh-my-zsh.sh


# User configuration
alias vim="nvim"

# Quick cd using fzf
fcd() {
  cd "$(find -type d | fzf --preview 'tree -C {} | head -200' --preview-window 'up:60%')"
}

# Find and edit using fzf
fe() {
  nvim "$(find -type f | fzf --preview 'cat {}' --preview-window 'up:60%')"
}

# alias cd="z"
alias tornew="pidof tor | xargs sudo kill -HUP"
alias ytdl="yt-dlp --proxy 'socks5://127.0.0.1:9150'"
alias bl="bluetoothctl"
alias blc="bluetoothctl connect"
alias bld="bluetoothctl disconnect"
alias ff="fastfetch"

alias qconfig="vim ~/.config/qtile/config.py"

alias wifi-status="nmcli dev status"
alias wifi-on="nmcli radio wifi on"
alias wifi-list="nmcli dev wifi list"
# wifi-connect SYNTAX: sudo nmcli dev wifi connect <SSID> password <password>
alias wifi-connect="sudo nmcli dev wifi connect"

alias unlock='sudo rm /var/lib/pacman/db.lck'    # remove pacman lock

# get error messages from journalctl
alias jctl="journalctl -p 3 -xb"

alias polkit-gnome="/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"

alias t="tmux"
alias e="exit"

# NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

### SETTING THE STARSHIP PROMPT ###
eval "$(starship init zsh)"

eval "$(zoxide init --cmd cd zsh)"
