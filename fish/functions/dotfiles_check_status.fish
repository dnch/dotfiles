function dotfiles_check_status
  set --erase --universal DOTFILES_DIRTY
  set --erase --universal DOTFILES_SHINY
  set --erase --universal DOTFILES_STALE

  set --query --universal DOTFILES_LAST_FETCH; or set DOTFILES_LAST_FETCH 0
  set --local DOTFILES_FETCH_WINDOW (math "24 * 60 * 60")

  # fish doesn't have sub-shells, sadface; remember where we were before
  set --local PREVIOUS_PWD (pwd)

  cd $XDG_CONFIG_HOME

  # if we know we haven't fetched in the past 24 hours, do so
  if test (math (date +%s) - $DOTFILES_LAST_FETCH) -gt $DOTFILES_FETCH_WINDOW
    echo "Checking GitHub for changes to dotfiles..."
    git fetch > /dev/null
    set --universal DOTFILES_LAST_FETCH (date +%s)
  end

  # Are there any local changes?
  if test ! -z (git status --porcelain | tail -n1)
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
  cd $PREVIOUS_PWD
end
