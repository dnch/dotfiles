# make all the things pretty, yo
source $XDG_CONFIG_HOME/fish/colors.fish

set -g fish_emoji_width 2

# load git helpers into path
set -x PATH $XDG_CONFIG_HOME/git/helpers $PATH

set -x EDITOR "code --wait"
set -x RBENV_ROOT "$HOME/.rbenv"

command --search rbenv >/dev/null; and status --is-interactive; and source (rbenv init -|psub)

alias bx="bundle exec"

# finally, load any machine-specific configuration
source $XDG_CONFIG_HOME/fish/config.local.fish

# and check to see if there's anyhting we need to do about our config
status --is-interactive; and dotfiles_check_status
