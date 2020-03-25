# Brew
echo "Installing homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing brew packages"
brew install $(cat ./brew-packages.txt)

# Rust
echo "Installing rust"
curl https://sh.rustup.rs -sSf | sh

