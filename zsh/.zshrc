### Enable Starship if installed
if type "starship" > /dev/null; then
   eval "$(starship init zsh)"
fi


### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
# zinit light-mode for \
#     zinit-zsh/z-a-rust \
#     zinit-zsh/z-a-as-monitor \
#     zinit-zsh/z-a-patch-dl \
#     zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

zinit ice wait lucid nocd atload'precmd_iterm_touchbar'
zinit light iam4x/zsh-iterm-touchbar

zinit ice wait lucid
zinit light zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

zinit ice lucid wait from"gh-r" as"program"
zinit light junegunn/fzf

zinit wait lucid for \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

# Enable case insensitive completions
# zplugin ice wait lucid atinit"zicompinit; zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'"
# zplugin light zdharma/null

## Mac specific
if [[ `uname` == 'Darwin' ]]; then

    # Zinit packets / scripts
    zinit ice wait lucid nocd atload'iterm2_precmd'
    zinit snippet https://iterm2.com/shell_integration/zsh

    zinit ice wait lucid
    zinit snippet $(brew --prefix)/etc/profile.d/autojump.sh

    # Mac aliases
    alias copy=pbcopy
    alias paste=pbpaste
    alias o='open .'

    # Homebrew specific
    if type "/usr/local/opt/nano/bin/nano" > /dev/null; then
        # Used later to for nano alias
        export NANO_PREFIX="/usr/local/opt/nano/bin/"
    fi

    # Add homebrew version of java to PATH
    export PATH="/usr/local/opt/openjdk/bin:$PATH"
    export CPPFLAGS="-I/usr/local/opt/openjdk/include"

    # Choose homebrew compilers over default
    export PATH="/usr/local/opt/llvm/bin:$PATH"

    export ANDROID_HOME="$HOME/Library/Android/sdk"     # Android
    export PATH=${PATH}:${HOME}/Library/Flutter/bin     # Flutter
    export GPG_TTY=$(tty)                               # GPG
    export PATH=${PATH}:${HOME}/.composer/vendor/bin    # PHP Composer
    export GOROOT="/usr/local/opt/go/libexec"           # Homebrew version of GO
    export PATH="${PATH}:/Library/TeX/texbin"           # Latex


## Linux specific
elif [[ `uname` == 'Linux' ]]; then

    # Linux aliases
    alias open=xdg-open
    alias copy='xclip -sel clip'
    alias e=exit

    export ANDROID_HOME="$HOME/Android/Sdk"                     # Android
    export PATH=${PATH}:${HOME}/.config/composer/vendor/bin     # PHP Composer

    # Tilix specifics
    # Source vte.sh if using tilix terminal
    if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
    fi

    if [ -d ~/.credentials ]; then
        source ~/.credentials
    fi

fi

# Aliases
alias ..='cd ..'
alias e='exit'
alias speedtest='speedtest-cli'

if type "ack" > /dev/null; then
    alias gack='git ls-files -oc --exclude-standard | ack -x'
fi

alias l='ls -a'
alias ll='ls -lFh'
alias la='ls -A'

# Directory specific aliases
alias dev='cd ~/Development/'
alias desk='cd ~/Desktop/'

# If neovim is installed
if type "nvim" > /dev/null; then
    export EDITOR='nvim'
    alias vim='nvim'
    alias v='nvim'
else
    export EDITOR='vim'
    alias v='vim'
fi

if type "hub" > /dev/null; then
    alias git=hub
fi

if type "nodejs" > /dev/null; then
    alias node=nodejs
fi

# Nano
alias nano="$(echo $NANO_PREFIX)nano --mouse"

# Light theme for bat command
export BAT_THEME="ansi-light"

# Enable colorized ls output
export CLICOLOR=1

# Android
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

# Go
export GOPATH="${HOME}/.go"
export PATH=${PATH}:${GOPATH}/bin

# Rust
export PATH="${PATH}:${HOME}/.cargo/bin"

# Export paths
export PATH="${PATH}:/usr/local/sbin"
export PATH="${PATH}:${HOME}/.local/bin"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

