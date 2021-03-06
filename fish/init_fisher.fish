# set up a storage directory for fisher packages
set -g fisher_path $XDG_CONFIG_HOME/var/fisher

mkdir -p $fisher_path

# install fisher if it doesn't already exist
if not functions -q fisher
  set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
  curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
  fish -c fisher
end

# make sure the fisher installation prefix is known
set fish_function_path $fish_function_path[1] $fisher_path/functions $fish_function_path[2..-1]
set fish_complete_path $fish_complete_path[1] $fisher_path/completions $fish_complete_path[2..-1]

# and load any confs
for file in $fisher_path/conf.d/*.fish
  builtin source $file 2> /dev/null
end
