function dotfiles_display_status
  if set -qu DOTFILES_STALE
    set segment_background $theme_color_alert_green
    set message "Upstream changes available"
  else if set -qu DOTFILES_DIRTY
    set segment_background $theme_color_alert_orange
    set message "Uncomitted changes in $XDG_CONFIG_HOME"
  else if set -qu DOTFILES_SHINY
    set segment_background $theme_color_alert_orange
    set message "Unpushed changes in $XDG_CONFIG_HOME"
  else
    set segment_background $theme_color_alert_red
    set message "I dunno, your guess is as good as mine"
  end

  set prompt_segments (powerline_segment $segment_background (set_color fff; echo 'dotfiles'))
  set prompt_segments $prompt_segments (powerline_segment $theme_color_neutral_500 (set_color $theme_color_neutral_200; echo $message))

  powerline $prompt_segments
end
