if test (uname -m) = "arm64"
  set BREW_PREFIX "/opt/homebrew"
else
  set BREW_PREFIX "/usr/local"
end

eval ($BREW_PREFIX/bin/brew shellenv)
