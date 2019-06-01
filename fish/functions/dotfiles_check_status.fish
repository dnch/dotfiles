function dotfiles_check_status
  set --erase --universal DOTFILES_DIRTY
  set --erase --universal DOTFILES_SHINY
  set --erase --universal DOTFILES_STALE

  cd $XDG_CONFIG_HOME

  # Are there any local changes?
  if test -n (git status --porcelain | tail -n1)
    set --universal DOTFILES_DIRTY "1"
  end

  # Do we have any commits that can be pushed?
  git status --short --branch | grep master | grep ahead > /dev/null
  if test $status -eq 0
    set --universal DOTFILES_SHINY "1"
  end

  # Do we have any commits that can be pulled?
  git status --short --branch | grep master | grep behind > /dev/null
  if test $status -eq 0
    set --universal DOTFILES_STALE "1"
  end

  # And return back to wherever we were before started checking
  cd -
end
