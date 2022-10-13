function __prompt_clock_segment
  set background_color $theme_color_neutral_500
  set content (set_color $theme_color_neutral_250; date "+%H:%M:%S")

  echo (powerline_segment $background_color $content)
end

function __prompt_path_segment
  switch $PWD
    case "$HOME/*" "$HOME"
      set background_color $theme_color_neutral_300
      set foreground_color $theme_color_neutral_100

    case "*"
      set background_color $theme_color_crimson_300
      set foreground_color $theme_color_crimson_100
  end

  set content (set_color $foreground_color; prompt_pwd)

  echo (powerline_segment $background_color $content)
end

function fish_prompt
  set -l last_status $status

  set prompt_segments (__prompt_clock_segment)
  set prompt_segments $prompt_segments (__prompt_path_segment)

  if test $last_status -ne 0
    set prompt_segments $prompt_segments (powerline_segment $theme_color_crimson_400 (set_color fff; echo !))
  end

  powerline $prompt_segments

  set_color normal
  printf ' '
end
