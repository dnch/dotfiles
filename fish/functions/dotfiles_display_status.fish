function dotfiles_display_status
  if set -qu DOTFILES_STALE
    echo "[dotfiles] ❇️️  Upstream changes available"
  else if set -qu DOTFILES_DIRTY
    echo "[dotfiles] ☣️  Uncommitted changes in $XDG_CONFIG_HOME"
  else if set -qu DOTFILES_SHINY
    echo "[dotfiles] 🅿️️  Unpushed changes in $XDG_CONFIG_HOME"
  end
end
