#!/usr/bin/env bash
UNAME_MACHINE="$(/usr/bin/uname -m)"

if [[ "${UNAME_MACHINE}" == "arm64" ]]; then
  HOMEBREW_PREFIX="/opt/homebrew"
else
  HOMEBREW_PREFIX="/usr/local"
fi

eval "$(${HOMEBREW_PREFIX}/bin/brew shellenv)"

defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder 1
defaults write com.googlecode.iterm2 PrefsCustomFolder "$PWD/iterm"

cp fish/config.local.fish.template fish/config.local.fish

brew bundle --no-lock

echo "$(brew --prefix)/bin/fish" | sudo tee -a /etc/shells

chsh -s "$(brew --prefix)/bin/fish"

