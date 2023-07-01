#!/bin/sh

# Finder
# Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable warning when changing file extensions
defaults write com.apple.finder FXEnableExtensionsChangeWarning -bool false

# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Hide recent tags
defaults write com.apple.finder ShowRecentTags -bool false

# Show Quit Finder option
defaults write com.apple.finder QuitMenuItem -bool true

# Set sidebar width to 200 pixels
defaults write com.apple.finder SidebarWidth -int 200

# Expand print panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForPrintMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForPrintMode2 -bool true

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Default view as columns
defaults write com.apple.finder "FXPreferredViewStyle" -string "clmv"

# Search in current folder by default
defaults write com.apple.finder "FXDefaultSearchScope" -string "SCcf"

# Show hidden files and folders
defaults write com.apple.finder "AppleShowAllFiles" -bool true

# Left click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Start new Finder windows in the Downloads folder
defaults write com.apple.finder NewWindowTarget PfLo

# Restart Finder
killall Finder

# TextEdit
# Use plain text mode for new TextEdit documents.
defaults write com.apple.TextEdit RichText -int 0

# Open and save files as UTF-8 in TextEdit.
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

# Dock
# Close open System Preferences panes to prevent them from overriding settings.
osascript -e 'tell application "System Preferences" to quit'

# Set time format
defaults write com.apple.menuextra.clock DateFormat HH:mm:ss

# Set languages
defaults write NSGlobalDomain AppleLanguage -array "en-RU" "ru-RU"

# Set icons sizes
defaults write com.apple.dock tilesize -integer 48

# Minimize apps to Dock
defaults write com.apple.dock 'minimize-to-application' -bool "true"

# Remove recents
defaults write com.apple.dock "show-recents" -bool "false"

# Restart Dock
killall Dock

# Brew
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install apps using Homebrew
brew install --cask visual-studio-code \
  warp \
  telegram-desktop \
  google-chrome \
  bitwarden \
  hiddenbar \
  dropbox \
  outline-manager \
  shottr \
  httpie \
  obsidian \
  numi \
  keepassxc \
  zoom \
  vlc \
  meld \
  vnc-viewer \
  discord \
  transmission \
  languagetool

brew install mas \
  openconnect \
  totp-cli \
  ffmpeg \
  yt-dlp \
  languagetool

mas install 1263070803 # lungo
mas install 1451685025 # wireguard
mas install 1356178125 # outline client
mas install 6448461551 # command x (ctrl + x)
mas install 411643860 # daisydisk

# Rclone
# Install Rclone
sudo -v ; curl https://rclone.org/install.sh | sudo bash

# ZSH
# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install spaceship prompt theme
brew install spaceship
echo "source $(brew --prefix)/opt/spaceship/spaceship.zsh" >> ~/.zshrc
echo "SPACESHIP_PROMPT_ASYNC=FALSE" >> ~/.zshrc

# NVM
# Install zsh-nvm plugin
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm
echo 'plugins+=(zsh-nvm)' >> ~/.zshrc
echo '' >> ~/.zshrc
echo 'alias zc="code . ~/.zshrc"' >> ~/.zshrc
echo 'alias reload="source ~/.zshrc"' >> ~/.zshrc
echo 'alias o="open ."' >> ~/.zshrc
echo 'alias v="code ."' >> ~/.zshrc

# Dockutil
echo 'Check this issue: https://github.com/kcrawford/dockutil/issues/127#issuecomment-1118733013'
read -p "Issue is fixed? (y/n) [n]: " choice
choice=${choice:-n}
if [[ $choice == "y" ]]; then
  brew install --cask hpedrorodrigues/tools/dockutil
elif [[ $choice == "n" ]]; then
  brew install dockutil
else
  echo "Invalid input."
fi

dockutil --remove Contacts
dockutil --remove TV
dockutil --remove Music
dockutil --remove Podcasts
dockutil --remove 'App Store'
dockutil --remove Photos
dockutil --remove Maps
dockutil --remove FaceTime
dockutil --remove Messages
dockutil --remove Launchpad
dockutil --remove Keynote
dockutil --remove Numbers
dockutil --remove Pages

dockutil --add /Applications/Visual\ Studio\ Code.app
dockutil --add /Applications/Warp.app
dockutil --add /Applications/Google\ Chrome.app --position 1
dockutil --add /Applications/Telegram\ Desktop.app --position 3
dockutil --add '' --type spacer --section apps --after Safari

# Git
echo '.DS_Store' >> ~/.config/git/ignore
git config --global core.excludesfile ~/.config/git/ignore
