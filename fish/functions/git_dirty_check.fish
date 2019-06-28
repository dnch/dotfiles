function git_dirty_check
  git status --porcelain 2> /dev/null | tail -n1
end
