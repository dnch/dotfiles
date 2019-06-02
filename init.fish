#!/usr/bin/env fish

# init.fish
#
# Handles the deployment / update of my dotfiles. :tada:

# capture the current directory of this script, use when moving files around
# ordinarily, we'd use $XDG_CONFIG_HOME, but it's safer to assume that isn't
# set up yet
set --local DOTFILES_ROOT (realpath (dirname (status --current-filename)))

# Setting XDG_CONFIG_HOME via `launchctl`
# =======================================
# The backbone of this entire set-up. Handy feature, although  I wish it were
# as simple as /etc/environment. Sigh.

set --local LAUNCH_AGENT_PATH $HOME/Library/LaunchAgents/io.dnch.dotfiles.plist

if test -f $LAUNCH_AGENT_PATH
  launchctl stop $LAUNCH_AGENT_PATH
  launchctl unload $LAUNCH_AGENT_PATH
end

cp -f $DOTFILES_ROOT/__support/dotfiles.plist $LAUNCH_AGENT_PATH

launchctl load $LAUNCH_AGENT_PATH
launchctl start $LAUNCH_AGENT_PATH

# Installing git-hooks
# ========================
# These hooks help witih tracking changes to local config and prompting
# commit / push / pull operations.

for hook_file in (ls $DOTFILES_ROOT/__support/git-hooks)
  set --local hook (string match -r '[a-z\-]+' $hook_file)

  ln -s -f $DOTFILES_ROOT/__support/git-hooks/$hook_file $DOTFILES_ROOT/.git/hooks/$hook
  chmod +x $DOTFILES_ROOT/.git/hooks/$hook
end
