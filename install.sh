#!/bin/bash

# This script will install everything needed to use the dotfiles

function install_vim {
    echo "Installing (neo)vim dependencies..."

    echo -e "\e[92m$ pip2 install --user neovim\e[39m"
    pip2 install --user neovim
    echo -e "\e[92m$ pip3 install --user neovim\e[39m"
    pip3 install --user neovim

    echo -e "\e[92m$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim neovim\e[39m"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
}

function install_vimperator {
    echo -e "\e[92m$ Cloning color schemes to ~/.vimperator/colors...\e[39m"
    git clone https://github.com/vimpr/vimperator-colors.git ~/.vimperator/colors

    echo -e "\e[92m$ Cloning plugins to ~/.vimperator/plugins...\e[39m"
    git clone -b 3.6 https://github.com/vimpr/vimperator-plugins.git ~/.vimperator/plugins
}

function install_zsh {
        echo -e "\e[92m$ git clone git://github.com/zsh-users/zsh-autosuggestions \$ZSH_CUSTOM/plugins/zsh-autosuggestions\e[39m"
        git clone git://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/plugins/zsh-autosuggestions
}

# VIM dependencies
read -p "Install neovim dependencies? [Y/n]" result
if [[ $result =~ ^[Yy]$ ]] || [ -z $result ]; then
    install_vim;
fi

# Vundle dependencies
read -p "Install vimperator (vim for firefox)? [Y/n]" result
if [[ $result =~ ^[Yy]$ ]] || [ -z $result ]; then
    install_vimperator;
fi

# ZSH dependencies
read -p "Install dependencies and plugins for Oh-My-Zsh? [Y/n]" result
if [[ $result =~ ^[Yy]$ ]] || [ -z $result ]; then
    install_zsh;
fi
