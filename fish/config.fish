# make all the things pretty, yo
source $XDG_CONFIG_HOME/fish/colors.fish

# load aliases
source $XDG_CONFIG_HOME/fish/aliases.fish

# load and export LSCOLORS
source $XDG_CONFIG_HOME/fish/lscolors.fish

# load git helpers into path
set -x PATH $XDG_CONFIG_HOME/git/helpers $PATH

 # encourage rubygems to play nicely
 set -x GEMRC $XDG_CONFIG_HOME/gem/config.yaml

# vscode is the _best_ code
set -x EDITOR "code --wait"

eval (direnv hook fish)

# manage language SDK versions with ASDF
. (brew --prefix asdf)/libexec/asdf.fish

# finally, load any machine-specific configuration
source $XDG_CONFIG_HOME/fish/config.local.fish

