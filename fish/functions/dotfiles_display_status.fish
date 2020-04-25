function dotfiles_display_status
  if set -qu DOTFILES_STALE
    set segment_background 00B100
    set message "Upstream changes available"
  else if set -qu DOTFILES_DIRTY
    set segment_background FF8A04
    set message "Uncomitted changes in $XDG_CONFIG_HOME"
  else if set -qu DOTFILES_SHINY
    set segment_background 055DF2
    set message "Unpushed changes in $XDG_CONFIG_HOME"
  end

  set prompt_segments (powerline_segment $segment_background (set_color fff; echo 'dotfiles'))
  set prompt_segments $prompt_segments (powerline_segment 080804 (set_color normal; echo $message))

  powerline $prompt_segments
end
