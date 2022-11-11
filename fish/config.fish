set -x XDG_CONFIG_HOME $HOME/.config

# make all the things pretty, yo
source $XDG_CONFIG_HOME/fish/colors.fish

# load aliases
source $XDG_CONFIG_HOME/fish/aliases.fish

# load and export LSCOLORS
source $XDG_CONFIG_HOME/fish/lscolors.fish

# load git helpers into path
set -x PATH $XDG_CONFIG_HOME/git/helpers $PATH

# vscode is the _best_ code
set -x EDITOR "code --wait"

# manage language SDK versions with ASDF
source (brew --prefix asdf)/asdf.fish

# finally, load any machine-specific configuration
source $XDG_CONFIG_HOME/fish/config.local.fish

