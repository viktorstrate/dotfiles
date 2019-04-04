set -l config_path $HOME/.config/fish/

source $config_path/fish_prompt.fish
source $config_path/fisher_bootstrap.fish

set os (uname)

# Aliases
alias e='exit'
alias speedtest='speedtest-cli'

alias ll='ls -lFh'
alias la='ls -A'

if type -q "ack"
    alias gack 'git ls-files -oc --exclude-standard | ack -x'
end

# Directory specific aliases
alias dev='cd ~/Development/'
alias desk='cd ~/Desktop/'

if type -q "nvim"
    set -x EDITOR 'nvim'
    alias vim nvim
    alias v nvim
end

# Application specific aliases
if type -q "hub"
    alias git hub
end

if type -q "nodejs"
    alias node nodejs
end

# macOS specific aliases
if test $os = 'Darwin'
    alias copy=pbcopy
    alias paste=pbpaste
    alias o 'open .'
    set -x NNN_COPY "$HOME/.nnn_copy.sh"
end

# Export paths
set -x PATH $PATH "/usr/local/sbin" "$HOME/.local/bin"

# Rustup
set PATH $PATH "$HOME/.cargo/bin"

# Android
if test $os = 'Darwin'
    set -x ANDROID_HOME "$HOME/Library/Android/sdk"
else
    set -x ANDROID_HOME "$HOME/Android/Sdk"
end

set PATH $PATH "$ANDROID_HOME/tools" "$ANDROID_HOME/platform-tools"

# Flutter
if test $os = 'Darwin'
    set PATH $PATH "$HOME/Library/Flutter/bin"
end

# Go
set -x GOPATH "$HOME/Development/go"
set PATH $PATH "$GOPATH/bin"

if test $os = 'Darwin'
    set -x GOROOT "/usr/local/opt/go/libexec/"
end

# PHP Composer
if test $os = 'Darwin'
    set PATH $PATH "$HOME/.composer/vendor/bin"
else
    set PATH $PATH "$HOME/.config/composer/vendor/bin"
end

# GPG
if test $os = 'Darwin'
    set -x GPG_TTY (tty)
end

# iTerm integration
if test $os = 'Darwin'
    # source "$HOME/.config/fish/iterm2_shell_integration.fish"
end
