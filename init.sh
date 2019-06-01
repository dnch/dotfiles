#!/usr/bin/env bash

# init.sh
# 
# Handles the deployment / update of my dotfiles. :tada:
# 
# Script-hardening and whatnot courtesy of:
# - https://sipb.mit.edu/doc/safe-shell/
# - https://kvz.io/blog/2013/11/21/bash-best-practices/

# preferred script-hardening mantra
set -euf -o pipefail

# capture the current directory of this script, use when moving files around
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Setting XDG_CONFIG_HOME via `launchctl`
# =======================================
# The backbone of this entire set-up. Handy feature, although  I wish it were 
# as simple as /etc/environment. Sigh.

PATH_TO_LAUNCH_AGENT="$HOME/Library/LaunchAgents/io.dnch.dotfiles.plist"

if [[ -f $PATH_TO_LAUNCH_AGENT ]]; then
  launchctl stop $PATH_TO_LAUNCH_AGENT
  launchctl unload $PATH_TO_LAUNCH_AGENT
fi

cp -f "$__dir/__support/dotfiles.plist" $PATH_TO_LAUNCH_AGENT

launchctl load $PATH_TO_LAUNCH_AGENT
launchctl start $PATH_TO_LAUNCH_AGENT
