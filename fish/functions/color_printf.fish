function __safe_set_color --argument-names color background
  if test -z "$background"
    echo -n (set_color $color)
  else
    echo -n (set_color --background $background $color)
  end
end

function color_printf
  argparse "b-background=" -- $argv

  set color $argv[1]
  set format $argv[2]
  set arguments $argv[3..-1]

  echo -n (__safe_set_color $color $_flag_background; printf $format $arguments)
end
