# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Aliases
alias e='exit'
alias speedtest='speedtest-cli'

if type "ack" > /dev/null; then
    alias gack='git ls-files -oc --exclude-standard | ack -x'
fi

alias ll='ls -lFh'
alias la='ls -A'

# Directory specific aliases
alias dev='cd ~/Development/'
alias desk='cd ~/Desktop/'

# Enter directory and list directory
#alias cd='cd $1 && ls'

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

# Linux specific aliases
if [[ `uname` == 'Linux' ]]; then
    alias open=xdg-open
    alias copy='xclip -sel clip'
    alias e=exit
fi

# macOS specific aliases
if [[ `uname` == 'Darwin' ]]; then
    alias copy=pbcopy
    alias paste=pbpaste
    alias o='open .'
    export NNN_COPY="$HOME/.nnn_copy.sh"

    if type "/usr/local/opt/nano/bin/nano" > /dev/null; then
        export NANO_PREFIX="/usr/local/opt/nano/bin/"
    fi
fi

# Nano
alias nano="$(echo $NANO_PREFIX)nano --mouse"

# Auto Jump
[ -f $(brew --prefix)/etc/profile.d/autojump.sh ] && . $(brew --prefix)/etc/profile.d/autojump.sh

### Tilix specefics
# Source vte.sh if using tilix terminal
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi

if [ -d ~/.credentials ]; then
    source ~/.credentials
fi

# Android
if [[ `uname` == 'Darwin' ]]; then
    export ANDROID_HOME="$HOME/Library/Android/sdk"
else
    export ANDROID_HOME="$HOME/Android/Sdk"
fi

export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

# Flutter
if [[ `uname` == 'Darwin' ]]; then
    export PATH=${PATH}:${HOME}/Library/Flutter/bin
fi

# GPG
if [[ `uname` == 'Darwin' ]]; then
    export GPG_TTY=$(tty)
fi

# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh

# PHP Composer path
if [[ `uname` == 'Darwin' ]]; then
    export PATH=${PATH}:${HOME}/.composer/vendor/bin
else
    export PATH=${PATH}:${HOME}/.config/composer/vendor/bin
fi

# Go
export GOPATH="${HOME}/.go"
export PATH=${PATH}:${GOPATH}/bin
if [[ `uname` == 'Darwin' ]]; then
    export GOROOT="/usr/local/opt/go/libexec"
fi

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Java
if [[ `uname` == 'Darwin' ]]; then
    # Add homebrew version of java to PATH
    export PATH="/usr/local/opt/openjdk/bin:$PATH"
    export CPPFLAGS="-I/usr/local/opt/openjdk/include"
fi

# Latex
export PATH="${PATH}:/Library/TeX/texbin"

# Export paths
export PATH="${PATH}:/usr/local/sbin"
export PATH="${PATH}:${HOME}/.local/bin"

# Choose homebrew compilers over default
export PATH="/usr/local/opt/llvm/bin:$PATH"

# GnuPG
# if [ -f ~/.gnupg/.gpg-agent-info ] && [ -n "$(pgrep gpg-agent)" ]; then
#     source ~/.gnupg/.gpg-agent-info
#     export GPG_AGENT_INFO
# else
#     eval $(gpg-agent --daemon --write-env-file ~/.gnupg/.gpg-agent-info)
# fi

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-iterm-touchbar)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# NVM - Node Verion Manager
# export NVM_DIR="$HOME/.nvm"
# if [[ `uname` == 'Darwin' ]]; then
#     alias loadnvm="source $(brew --prefix nvm)/nvm.sh"
# fi

# This isn't loaded here, because it adds 3-6 sec to startup time
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
if [ -d ~/.rvm/ ]; then
    export PATH="$PATH:$HOME/.rvm/bin"
    echo "here?"
elif [ -d ~/.gem/ruby/2.5.0/bin/ ]; then
    export PATH="$PATH:$HOME/.gem/ruby/2.5.0/bin"
else
    # If RVM is not used, prioritize brew version of ruby
    if [ -d /usr/local/opt/ruby/bin/ ]; then
        export PATH="/usr/local/opt/ruby/bin:$PATH"
        export LDFLAGS="-L/usr/local/opt/ruby/lib"
        export CPPFLAGS="-I/usr/local/opt/ruby/include"
    fi
fi

# export PATH=/Users/viktorstrate/.local/bin/luna-studio:$PATH

# For iterm2 shell integrations
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
