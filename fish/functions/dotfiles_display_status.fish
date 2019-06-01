function dotfiles_display_status
  if set --query --universal DOTFILES_DIRTY; echo "☣️ "; end
  if set --query --universal DOTFILES_SHINY; echo "🅿️ "; end
  if set --query --universal DOTFILES_STALE; echo "❇️ "; end
end
