function dotfiles_display_status
  if set -qu DOTFILES_STALE
    printf "%s", \U0001F17F # 🅿️
  else if set -qu DOTFILES_DIRTY
    printf "%s", \U00002623 # ☣️
  else if set -qu DOTFILES_SHINY
    printf "%s", \U00002747 # ❇️
  end
end
