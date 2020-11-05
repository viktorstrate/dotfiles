# Brew
echo "Installing homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing brew packages"
brew install $(cat ./brew-packages.txt)

# Rust
echo "Installing rust"
curl https://sh.rustup.rs -sSf | sh

# Oh-My-Zsh
echo "Installing ohmyzsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Oh-My-Zsh autocomplete
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
