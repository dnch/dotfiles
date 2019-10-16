function fish_right_prompt
  set items (string trim (starship module git_status))
  set items $items (string trim (starship module git_state))
  set items $items (string trim (starship module git_branch))

  powerline --tone=dark --fade=in --direction=right $items
end
