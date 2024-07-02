#!/bin/bash 

echo "joe's setup script"

# homebrew -----------------
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/joseph.lewis/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# terminal -----------------
brew install --cask wezterm
brew install stow
brew install neovim
brew install tmux
brew install tmuxinator
brew install fzf
# for autocomplete - better than apple shipped one
brew install openssh

# email -----------------
brew install neomutt
##brew install davmail - this doesn't waork as can't run in O365 INteractive
# install from the website instead
# for davmail mainly
brew install java
sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk \
     /Library/Java/JavaVirtualMachines/openjdk.jdk
brew install isync
brew install imapfilter
brew install bogofilter
brew install notmuch
brew install notmuch-mutt
brew install urlscan

# calendar ---------------
brew install khal
brew install vdirsyncer

# prompt ------------------
brew install starship

# R
brew install R
# install radian via miniconda 
brew install --cask quarto
brew install pandoc

# rss reader
brew install newsboat

cd ~
git clone https://github.com/joelewis101/.dotfiles
cd ~/.dotfiles
stow nvim
stow tmux
stow neomutt
stow mbsync
stow tmuxinator
stow imapfilter
stow git
stow ssh
stow zsh
stow starship
stow wezterm
stow urlscan
stow khal
stow notmuch

# setup mail
mkdir ~/Mail
mkdir ~/Mail/lstmed
mkdir ~/Mail/UoL
mkdir ~/Mail/doctors

notmuch new
# make a cache directory by doing a search
notmuch-mutt search hello

echo "Training bogofilter ..."
bogofilter -M -s -I ~/Mail/lstmed/Junk/
bogofilter -M -s -I ~/Mail/UoL/Junk/
bogofilter -M -s -I ~/Mail/doctors/Junk/
bogofilter -M -n -I ~/Mail/lstmed/Archive/
bogofilter -M -n -I ~/Mail/UoL/Archive/
bogofilter -M -n -I ~/Mail/doctors/Archive/
bogofilter -M -n -I ~/Mail/lstmed/Sent/
bogofilter -M -n -I ~/Mail/UoL/Sent/
bogofilter -M -n -I ~/Mail/doctors/Sent/

# to set up github ssh keys
# https://gist.github.com/qin-yu/bc26a2d280ee2e93b2d7860a1bfbd0c5
#




