if test "(uname -m)" = "arm64"
  set HOMEBREW_PREFIX "/opt/homebrew"
else
  set HOMEBREW_PREFIX "/usr/local"
end

eval ($HOMEBREW_PREFIX/bin/brew shellenv)
