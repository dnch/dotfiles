# slightly warm greys:
# 080804 12120E 1C1C18 20201C 30302C 444440 555551 666662
# 777773 888884 999995 AAAAA6 BBBBB7 CCCCC8 DDDDD9

# the default color
# set fish_color_normal

# don't underline paths
set -U fish_color_valid_path normal

# the color for commands
set -U fish_color_command F2B706

# the color for quoted blocks of text
set -U fish_color_quote afd75f

# the color for IO redirections
set -U fish_color_redirection 5fafd7

# the color for process separators like ';' and '&'
set -U fish_color_end af005f

# the color used to highlight potential errors
set -U fish_color_error 960

# the color for regular command parameters
set -U fish_color_param normal

# the color used for code comments
set -U fish_color_comment 444440

# the color used to highlight matching parenthesis
set -U fish_color_match ffc

# the color used when selecting text (in vi visual mode)
# set -U fish_color_selection

# used to highlight history search matches and the selected pager item (must be a background)
set -U fish_color_search_match '--background=426E88' 'fff'

# the color for parameter expansion operators like '*' and '~'
set -U fish_color_operator normal

# the color used to highlight character escapes like '\n' and '\x70'
set -U fish_color_escape magenta

# the color used for the current working directory in the default prompt
# set -U fish_color_cwd

# the color used for autosuggestions
set -U fish_color_autosuggestion 666662

# the color used to print the current username in some of fish default prompts
# set -U fish_color_user

# the color used to print the current host system in some of fish default prompts
# set -U fish_color_host

# the color for the '^C' indicator on a canceled command
set -U fish_color_cancel '--background=red' 'brwhite'

# Additionally, the following variables are available to change the highlighting in the completion pager:

# the color of the progress bar at the bottom left corner
set -U fish_pager_color_progress '--background=30302C' '888884'

# the background color of a line
# set -U fish_pager_color_background

# the color of the prefix string, i.e. the string that is to be completed
set -U fish_pager_color_prefix 7194A8

# the color of the completion itself
set -U fish_pager_color_completion BBBBB7

# the color of the completion description
set -U fish_pager_color_description 777773

# fish_pager_color_background of every second unselected completion. Defaults to fish_pager_color_background
# set -U fish_pager_color_secondary_background

# fish_pager_color_prefix of every second unselected completion. Defaults to fish_pager_color_prefix
# set -U fish_pager_color_secondary_prefix

# fish_pager_color_completion of every second unselected completion. Defaults to fish_pager_color_completion
# set -U fish_pager_color_secondary_completion

# fish_pager_color_description of every second unselected completion. Defaults to fish_pager_color_description
# set -U fish_pager_color_secondary_description

# fish_pager_color_background of the selected completion. Defaults to fish_color_search_match
set -U fish_pager_color_selected_background '--background=426E88' 'fff'

# fish_pager_color_prefix of the selected completion. Defaults to fish_pager_color_prefix
set -U fish_pager_color_selected_prefix 43B4E8

# fish_pager_color_completion of the selected completion. Defaults to fish_pager_color_completion
set -U fish_pager_color_selected_completion fff

# fish_pager_color_description of the selected completion. Defaults to fish_pager_color_description
set -U fish_pager_color_selected_description 33a4d8
