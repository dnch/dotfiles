source "$XDG_CONFIG_HOME/fish/functions/__git_prompt_helpers.fish"

function __maybe_you_shouldnt_do_that_segment --argument-names inside_git_dir bare_repo
  if test 'true' = $inside_git_dir
    if test 'true' = $bare_repo
      echo (powerline_segment red (set_color fff; echo "(bare)"))
    else
      echo (powerline_segment red (set_color fff; echo "(in git dir)"))
    end
  end
end

function __branch_segment --argument-names git_dir sha
  set POWERLINES_BRANCH_SYMBOL \uE0A0
  set DETATCHED_SYMBOL \u019F

  echo (__git_prompt_branch_details git_dir sha) | read branch operation detached

  echo (powerline_segment blue (color_printf 000 "%s %s" $POWERLINES_BRANCH_SYMBOL $branch))
end

function __stash_segment --argument-names git_dir
  if test -r $git_dir/logs/refs/stash
    echo (powerline_segment B06698 (color_printf fff '$ (%i)' (count < $git_dir/log/refs/stash)))
  end
end

function __changes_segment
  echo (__git_prompt_change_details) | read dirty invalid staged untracked

  echo (powerline_segment B06698 (color_printf fff "D%i I%i S%i ?%i" $dirty $invalid $staged $untracked))
end

function __remote_segment
  echo (__git_prompt_upstream_details) | read behind ahead

  echo (powerline_segment 025CBB (color_printf fff "%i %i" $behind $ahead))
end

function fish_right_prompt
  # echo (__git_repo_info; set git_info_exit_status $status) | read git_dir inside_git_dir bare_repo inside_worktree sha

  # # if fetching git_repo_info failed, we're not in a repo -- bail out.
  # test $git_info_exit_status -eq 0
  #   or return

  # set prompt_segments
  # set prompt_segments $prompt_segments (__branch_segment $git_dir $sha)
  # set prompt_segments $prompt_segments (__changes_segment)
  # set prompt_segments $prompt_segments (__remote_segment)

  # powerline --direction right $prompt_segments
end
