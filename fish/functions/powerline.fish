function __powerline_default_direction --argument-names value
  switch (string lower "$value")
    case right; echo "right"
    case "*"; echo "left"
  end
end

function powerline --description "Prints a Powerline-style segmented list"
  set powerline__LEFT_SEGMENT_SEPARATOR     \uE0B0
  set powerline__RIGHT_SEGMENT_SEPARATOR    \uE0B2
  set powerline__LEFT_SUBSEGMENT_SEPARATOR  \uE0B1
  set powerline__RIGHT_SUBSEGMENT_SEPARATOR \uE0B3
  set powerline__SEGMENT_TEMPLATE " %s "

  set powerline_options (fish_opt -s d -l direction --required-val --long-only)

  argparse $powerline_options -- $argv

  set direction (__powerline_default_direction $_flag_direction)

  set segments $argv

  if test (count $segments) -lt 1; return 1; end

  switch $direction
    case left; set separator $powerline__LEFT_SEGMENT_SEPARATOR
    case right; set separator $powerline__RIGHT_SEGMENT_SEPARATOR
  end

  for segment in $segments
    string split0 $segment | read -lz background_color content

    # write the separator between the current segment and the previous one;
    # writing the separator before the content gets around having to look-ahead
    # in the loop, we can simply save the colour at the end, effectively looking
    # behind to manage the overlap
    if test -n "$previous_segment_color" -o $direction = right
      switch $direction
        case left
          set separator_color $previous_segment_color
          set overlap_color $background_color

        case right
          set separator_color $background_color
          set overlap_color $previous_segment_color

          if test -z $overlap_color; set overlap_color normal; end
      end

      set_color --background $overlap_color $separator_color
      printf '%s' $separator
    end

    set_color --background $background_color
    printf $powerline__SEGMENT_TEMPLATE (string trim $content)

    set previous_segment_color $background_color
  end

  if test $direction = left
    set_color --background normal $previous_segment_color
    printf '%s' $separator
  end

  set_color normal
end
