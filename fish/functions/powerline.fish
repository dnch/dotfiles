function powerline --description "Prints a Powerline-style segmented list"
  set powerline__LEFT_SEGMENT_SEPARATOR     \uE0B0
  set powerline__RIGHT_SEGMENT_SEPARATOR    \uE0B2
  set powerline__LEFT_SUBSEGMENT_SEPARATOR  \uE0B1
  set powerline__RIGHT_SUBSEGMENT_SEPARATOR \uE0B3
  set powerline__SEGMENT_PADDING "  "

  set -l options (fish_opt -s h -l help)
  set -l options $options (fish_opt -s x -l debug)

  set options $options (fish_opt --short=t --long=tone --optional --long-only)
  set options $options (fish_opt --short=f --long=fade --optional --long-only)
  set options $options (fish_opt --short=d --long=direction --optional --long-only)

  argparse $options -- $argv

  set segments $argv

  if test (count $segments) -lt 1
    return 0
  end

  if test $_flag_help
    echo "HELP GOES HERE"
    return 0
  end

  # establish defaults;
  if test -z $_flag_tone; set _flag_tone 'dark'; end
  if test -z $_flag_fade; set _flag_fade 'in'; end
  if test -z $_flag_direction; set _flag_direction 'left'; end

  switch $_flag_tone
    # dark greys
    case dark
      set bg_color_sequence 444440 555551 666662 777773 888884
      set fg_color_sequence 999995 AAAAA6 BBBBB7 CCCCC8 DDDDD9

    # light greys
    case light
      set bg_color_sequence 999995 AAAAA6 BBBBB7 CCCCC8 DDDDD9
      set fg_color_sequence 444440 555551 666662 777773 777773

    case pride
      set bg_color_sequence FF2600 FF9300 FFFB00 4F8F00 0096FF
      set fg_color_sequence fff fff fff fff fff

  end

  set bg_color_sequence $bg_color_sequence[1..(count $segments)]
  set fg_color_sequence $fg_color_sequence[1..(count $segments)]

  if test $_flag_fade != "in"
    set bg_color_sequence $bg_color_sequence[-1..1]
    set fg_color_sequence $fg_color_sequence[-1..1]
  end

  switch $_flag_direction
    case left
      set sequence (seq (count $segments))
      set separator $powerline__LEFT_SEGMENT_SEPARATOR
      set alpha_terminator ''
      set omega_terminator $powerline__LEFT_SEGMENT_SEPARATOR

    case right
      set sequence (seq (count $segments) 1)
      set separator $powerline__RIGHT_SEGMENT_SEPARATOR
      set alpha_terminator $powerline__RIGHT_SEGMENT_SEPARATOR
      set omega_terminator ''
  end

  set alpha $sequence[1]
  set omega $sequence[-1]

  if test $_flag_debug
    echo $options
    echo $segments
    echo $_flag_direction
    echo $_flag_tone
    echo $_flag_fade
    echo $sequence
    echo $bg_color_sequence
    echo $fg_color_sequence

    echo $alpha
    echo $omega
  end



  set_color --background normal $bg_color_sequence[$alpha]
  printf '%s' $alpha_terminator

  for i in $sequence
    set_color --background $bg_color_sequence[$i] $fg_color_sequence[$i]
    printf '%s%s%s' $powerline__SEGMENT_PADDING $segments[$i] $powerline__SEGMENT_PADDING

    if test $i -ne $sequence[-1]
      switch $_flag_direction
        case left;
          set separator_bg $bg_color_sequence[(math $i + 1)]
          set separator_fg $bg_color_sequence[$i]

        case right;
          set separator_bg $bg_color_sequence[$i]
          set separator_fg $bg_color_sequence[(math $i - 1)]
      end

      set_color --background $separator_bg $separator_fg
      printf '%s' $separator
    end
  end

  set_color --background normal $bg_color_sequence[$omega]
  printf '%s' $omega_terminator

  set_color normal
  printf '\n'
end
