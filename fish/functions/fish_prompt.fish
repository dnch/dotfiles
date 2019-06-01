# [ hh:mm:ss ] dan: ~/c/path (status) >
function fish_prompt
  echo
  echo (set_color 777)"[" (date "+%H:%M:%S") "]"(set_color normal) (whoami)":" (prompt_pwd) (dotfiles_display_status) "> "
end
