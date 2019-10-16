function fish_prompt
  set prompt_clock_color 555551
  set prompt_pwd_color normal
  set prompt_character_color 999900
  set prompt_character \U276f

  echo
  colored_span (printf '[ %s ] ' (date "+%H:%M:%S")) $prompt_clock_color
  colored_span (prompt_pwd) $prompt_pwd_color
  colored_span (printf ' %s ' $prompt_character) $prompt_character_color
end
