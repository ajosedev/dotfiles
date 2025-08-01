#!/usr/bin/env bash

# TODO - Have to figure out commands for these
# - Modifier keys: Caps lock -> Control
# TODO - need to get ssh keys first for GitHub
# TODO - zsh installation stops rest of script

# Heavily inspired by https://github.com/kentcdodds/dotfiles/blob/master/.macos =

###############################################################################
# Pre-setup                                                                   #
###############################################################################

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &

###############################################################################
# General UI/UX                                                               #
###############################################################################

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Set highlight colour
defaults write NSGlobalDomain AppleHighlightColor -string "0.764700 0.976500 0.568600"

# Set accent colour
defaults write NSGlobalDomain AppleAccentColor 6

# Always show scrollbars
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################

# Disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable “natural” (Lion-style) scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Enable key repeating
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

###############################################################################
# Dock, Dashboard, and hot corners                                            #
###############################################################################

# Set the icon size of Dock items to 24 pixels
defaults write com.apple.dock tilesize -int 24

# Wipe all (default) app icons from the Dock
# This is only really useful when setting up a new Mac, or if you don’t use
# the Dock to launch apps.
defaults write com.apple.dock persistent-apps -array

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

###############################################################################
# Finder                                                                      #
###############################################################################

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

###############################################################################
# Dev                                                                         #
###############################################################################

# Make code folder
mkdir -p "${HOME}/code"

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install CLI stuff with brew
brew install \
  autojump \
  bat \
  coreutils \
  fd \
  fpp \
  fzf \
  gh \
  git \
  jq \
  neovim \
  ripgrep \
  sd \
  tldr \
  yarn

# Tap homebrew/cask-versions
brew tap homebrew/cask-versions

# Install apps with brew cask
brew install --cask \
  1password \
  clocker \
  docker \
  firefox \
  firefox-developer-edition \
  google-chrome \
  iterm2 \
  itsycal \
  obsidian \
  raycast \
  sequel-pro \
  slack \
  spotify \
  visual-studio-code \
  zoom

# Install node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
source ~/.bashrc
nvm install --lts

# Install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install emacs
# brew tap railwaycat/emacsmacport
# brew install emacs-mac --with-modules
# ln -s /usr/local/opt/emacs-mac/Emacs.app /Applications/Emacs.app
# git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
# ~/.emacs.d/bin/doom install

###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in "Activity Monitor" \
  "cfprefsd" \
  "Dock" \
  "Finder" \
  "SystemUIServer"; do
  killall "${app}" &>/dev/null
done
echo "Done. Note that some of these changes require a logout/restart to take effect."
