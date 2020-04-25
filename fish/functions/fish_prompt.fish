function __prompt_clock_segment
  set background_color 333330
  set content (set_color 999995; date "+%H:%M:%S")

  echo (powerline_segment $background_color $content)
end

function __prompt_path_segment
  switch $PWD
    case $HOME
      set background_color 9c0
      set foreground_color 000

    case "*.git"
      set background_color c09
      set foreground_color fff

    case "*"
      set background_color c90
      set foreground_color 000
  end

  set content (set_color 000; prompt_pwd)

  echo (powerline_segment $background_color $content)
end

function fish_prompt
  set prompt_segments (__prompt_clock_segment)
  set prompt_segments $prompt_segments (__prompt_path_segment)

  powerline $prompt_segments

  set_color normal
  printf ' '
end
