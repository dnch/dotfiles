function powerline_demo
  set items (string trim (starship module git_status))
  set items $items (string trim (starship module git_state))
  set items $items (string trim (starship module git_branch))


  powerline --tone=dark --fade=in --direction=left $items
  echo

  powerline --tone=dark --fade=in --direction=right $items
  echo

  powerline --tone=dark --fade=out --direction=left $items
  echo

  powerline --tone=dark --fade=out --direction=right $items
  echo

  powerline --tone=light --fade=in --direction=left $items
  echo

  powerline --tone=light --fade=in --direction=right $items
  echo

  powerline --tone=light --fade=out --direction=left $items
  echo

  powerline --tone=light --fade=out --direction=right $items
  echo

end
