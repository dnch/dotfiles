#!/usr/bin/env bash

defaults write com.googlecode.iterm2 PrefsCustomFolder "/Users/dan/.config/iterm"

cp fish/config.local.fish.template fish/config.local.fish

brew bundle --no-lock

echo "$(brew --prefix)/bin/fish" | sudo tee -a /etc/shells

chsh -s "$(brew --prefix)/bin/fish"

