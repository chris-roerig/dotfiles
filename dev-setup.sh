#!/bin/bash
#
# This script is my completly over-engineered way to install and
# setup a Fedora development station.
#

# software i like
DNF_PACKAGES="git curl rubypick wget terminator sublime-text vim vala lua golang zsh gh"

# add sublime repo
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo

# add github cli repo
sudo dnf install 'dnf-command(config-manager)'
sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo

# update the package repository
sudo dnf update -y

# install the software i like
sudo dnf install -y $DNF_PACKAGES

# make zsh the default shell
chsh -s $(which zsh)

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install ruby bunlder
gem install bundler

#
# pull my dotfiles
#

# vimrc
curl -o $HOME/.vimrc https://raw.githubusercontent.com/chris-roerig/dotfiles/master/vimrc

# get and install Vundle (vim plugin manager)
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# terminator
curl -o $HOME/.config/terminator/config https://raw.githubusercontent.com/chris-roerig/dotfiles/master/terminator/config

# sublime-text preferences
curl -o $HOME/.config/sublime-text/Packages/User/Preferences.sublime-settings https://raw.githubusercontent.com/chris-roerig/dotfiles/master/Preferences.sublime-settings
curl -o $HOME/.config/sublime-text/Packages/User/Default\s\(Linux\).sublime-keymap "https://raw.githubusercontent.com/chris-roerig/dotfiles/master/Default%20(Linux).sublime-keymap"

# set terminator as the default terminal
gsettings set org.gnome.desktop.default-applications.terminal exec /usr/bin/terminator
gsettings set org.gnome.desktop.default-applications.terminal exec-arg "-x"

exit 0