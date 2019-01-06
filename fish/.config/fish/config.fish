# Fish shell related

function prompt_git_branch
    set -l branch (
        begin
            git symbolic-ref HEAD; or \
            git rev-parse --short HEAD
        end ^/dev/null | sed -e 's|^refs/heads/||'
    )

    if test $branch
        echo -n -s (set_color brred)
        echo -n -s $branch ' '
    end
end

set fish_color_cwd_root 'red'

function fish_prompt --description 'Write out the prompt'
	set -l color_cwd
    set -l suffix
    set -l success

    switch "$USER"
        case root toor
            if set -q fish_color_cwd_root
                set color_cwd $fish_color_cwd_root
            else
                set color_cwd $fish_color_cwd
            end
            set suffix '#'
        case '*'
            set color_cwd $fish_color_cwd
            set suffix '$'
    end

    if test $status = 0
        set success "green"
    else
        set success "red"
    end

    # echo -n -s (set_color normal) "$USER "
    echo -n -s (set_color $color_cwd) (prompt_pwd) ' '
    echo -n -s (prompt_git_branch)
    echo -n -s (set_color $success) "$suffix "
end

function fish_greeting
    echo -s "Welcome " (whoami)
end

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
    set -x NNN_COPY "$HOME/.nnn_copy.sh"
end

# Export paths
set -x PATH $PATH "/usr/local/sbin" "$HOME/.local/bin"

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
