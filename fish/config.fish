# make all the things pretty, yo
source $XDG_CONFIG_HOME/fish/colors.fish

# load aliases
source $XDG_CONFIG_HOME/fish/aliases.fish

# grrr, argh
set -g fish_emoji_width 2

# load git helpers into path
set -x PATH $XDG_CONFIG_HOME/git/helpers $PATH

# vscode is the _best_ code
set -x EDITOR "code --wait"

# loading rbenv
set -x RBENV_ROOT "$HOME/.rbenv"
command --search rbenv >/dev/null; and status --is-interactive; and source (rbenv init -|psub)

# finally, load any machine-specific configuration
source $XDG_CONFIG_HOME/fish/config.local.fish

# and check to see if there's anything we need to do about our config
status --is-interactive; and dotfiles_check_status
