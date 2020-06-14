#!/bin/sh

echo "Installing basictex"
brew cash install basictex

echo "Installing latex packages"
sudo tlmgr < latex-packages.txt

echo "Installing latex indent dependencies"
brew install perl
sudo cpan install Log::Log4perl Log::Dispatch::File YAML::Tiny File::HomeDir Unicode::GCString
