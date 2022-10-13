# based off of the fish-git-prompt script that ships with fish, which is itself
# based off of the git-prompt script that ships with git
#
# Original Code:
# Written by Kevin Ballard <kevin@sb.org>
# Updated by Brian Gernhardt <brian@gernhardtsoftware.com>
#
# This is heavily based off of the git-prompt.bash script that ships with
# git, which is Copyright (C) 2006,2007 Shawn O. Pearce <spearce@spearce.org>.
# The act of porting the code, along with any new code, are Copyright (C) 2012
# Kevin Ballard <kevin@sb.org>.
#
# Tweaks and optimisations (C) 2010 Dan Cheail <dan@dnch.io>
#
# By virtue of being based on the git-prompt.bash script, this script is
# distributed under the GNU General Public License, version 2.0.

function __git_repo_info
  command -sq git; and command git rev-parse --git-dir --is-inside-git-dir --is-bare-repository --is-inside-work-tree HEAD 2>/dev/null
end

function __git_prompt_upstream_details
  # Find how many commits we are ahead/behind our upstream
  set upstream_status (command git rev-list --count --left-right '@{upstream}'...HEAD 2>/dev/null | string replace \t " ")

  echo $upstream_status
end

function __git_prompt_change_details
  set -l changed_files (command git diff --name-status 2>/dev/null | string match -r \\w)
  set -l staged_files (command git diff --staged --name-status | string match -r \\w)

  set -l count_changed (count $changed_files)
  set -l count_changed_unmerged (count (string match -r "U" -- $changed_files))
  set -l count_dirty (math $count_changed - $count_changed_unmerged)

  set -l count_staged_total (count $staged_files)
  set -l count_invalid (count (string match -r "U" -- $staged_files))
  set -l count_staged_actual (math $count_staged_total - $count_invalid)

  set -l count_untracked (command git ls-files --others --exclude-standard | count)

  echo $count_dirty
  echo $count_invalid
  echo $count_staged_actual
  echo $count_untracked
end

function __git_prompt_branch_details --argument-names git_dir sha
  set -l branch
  set -l operation none
  set -l detached no
  set -l current_step
  set -l total_steps
  set -l git_operation_status

  if test -d $git_dir/rebase-merge
    set branch (cat $git_dir/rebase-merge/head-name 2>/dev/null)
    set current_step (cat $git_dir/rebase-merge/msgnum 2>/dev/null)
    set total_steps (cat $git_dir/rebase-merge/end 2>/dev/null)

    if test -f $git_dir/rebase-merge/interactive
      set operation "REBASE-i"
    else
      set operation "REBASE-m"
    end
  else
    if test -d $git_dir/rebase-apply
      set current_step (cat $git_dir/rebase-apply/next 2>/dev/null)
      set total_steps (cat $git_dir/rebase-apply/last 2>/dev/null)

      if test -f $git_dir/rebase-apply/rebasing
        set branch (cat $git_dir/rebase-apply/head-name 2>/dev/null)
        set operation "REBASE"
      else if test -f $git_dir/rebase-apply/applying
        set operation "AM"
      else
        set operation "AM/REBASE"
      end
    else if test -f $git_dir/MERGE_HEAD
      set operation "MERGING"
    else if test -f $git_dir/CHERRY_PICK_HEAD
      set operation "CHERRY-PICKING"
    else if test -f $git_dir/REVERT_HEAD
      set operation "REVERTING"
    else if test -f $git_dir/BISECT_LOG
      set operation "BISECTING"
    end
  end

  if test -n "$current_step" -a -n "$total_steps"
    set operation "$operation ($current_step/$total_steps)"
  end

  if test -z "$branch"
    set branch (command git symbolic-ref HEAD 2>/dev/null; set git_operation_status $status)

    if test $git_operation_status -ne 0
      set detached yes
      set branch (command git describe --contains --all HEAD 2>/dev/null; set git_operation_status $status)

      if test $git_operation_status -ne 0
        # Shorten the sha ourselves to 8 characters - this should be good for most repositories,
        # and even for large ones it should be good for most commits
        if set -q sha
          set branch (string match -r '^.{8}' -- $sha)
        else
          set branch unknown
        end
      end

      set branch "($branch)"
    end
  end

  echo (string replace refs/heads/ '' -- $branch)
  echo $operation
  echo $detached
end
