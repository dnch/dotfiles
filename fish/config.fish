# make all the things pretty, yo
source $XDG_CONFIG_HOME/fish/colors.fish

set -g fish_emoji_width 2

set -x EDITOR "code --wait"

# finally, load any machine-specific configuration
source $XDG_CONFIG_HOME/fish/config.local.fish

# and check to see if there's anyhting we need to do about our config
status --is-interactive; and dotfiles_check_status
