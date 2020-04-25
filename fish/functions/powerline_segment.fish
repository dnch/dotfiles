function __powerline_segment_default_color --argument-names current_value default_value
  if test -z "$current_value"
    echo $default_value
  else
    echo $current_value
  end
end

function powerline_segment --argument-names background_color segment_content
  set background_color (__powerline_segment_default_color $background_color 30302C)

  echo -n $background_color $segment_content | string join0
end
