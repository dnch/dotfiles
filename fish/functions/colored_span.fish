function colored_span --argument-names text color
  echo -n (set_color $color)$text(set_color normal)
end
