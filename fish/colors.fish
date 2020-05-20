# theme colors
set -U theme_color_candy_100 ffb3d0
set -U theme_color_candy_200 e89bb7
set -U theme_color_candy_300 ce839f
set -U theme_color_candy_400 9c5571
set -U theme_color_candy_500 833f5b

set -U theme_color_lilac_100 cfa9f0
set -U theme_color_lilac_200 b691d6
set -U theme_color_lilac_300 9d7abd
set -U theme_color_lilac_400 6e4d8d
set -U theme_color_lilac_500 573875

set -U theme_color_violet_100 b6afff
set -U theme_color_violet_200 9d97e5
set -U theme_color_violet_300 8480cc
set -U theme_color_violet_400 54549b
set -U theme_color_violet_500 3c3f83

set -U theme_color_azure_100 8caff2
set -U theme_color_azure_200 7397d8
set -U theme_color_azure_300 5a80bf
set -U theme_color_azure_400 24548e
set -U theme_color_azure_500 003f77

set -U theme_color_sapphire_100 5f96b8
set -U theme_color_sapphire_200 467fa0
set -U theme_color_sapphire_300 2c6888
set -U theme_color_sapphire_400 003e5b
set -U theme_color_sapphire_500 002a46

set -U theme_color_emerald_100 729d6a
set -U theme_color_emerald_200 5b8554
set -U theme_color_emerald_300 456e3f
set -U theme_color_emerald_400 1a4217
set -U theme_color_emerald_500 052e00

set -U theme_color_lime_100 bcca8a
set -U theme_color_lime_200 a3b173
set -U theme_color_lime_300 8b995c
set -U theme_color_lime_400 5d6b31
set -U theme_color_lime_500 47551c

set -U theme_color_lemon_100 ffe588
set -U theme_color_lemon_200 ffcc70
set -U theme_color_lemon_300 e8b359
set -U theme_color_lemon_400 b3842a
set -U theme_color_lemon_500 996d10

set -U theme_color_orange_100 ff966d
set -U theme_color_orange_200 ea7e57
set -U theme_color_orange_300 ce6741
set -U theme_color_orange_400 983917
set -U theme_color_orange_500 7d2301

set -U theme_color_crimson_100 ed6556
set -U theme_color_crimson_200 d14c40
set -U theme_color_crimson_300 b5332c
set -U theme_color_crimson_400 7e0003
set -U theme_color_crimson_500 650000

set -U theme_color_rose_100 e76280
set -U theme_color_rose_200 cc496a
set -U theme_color_rose_300 b12f54
set -U theme_color_rose_400 7c002c
set -U theme_color_rose_500 62001a

set -U theme_color_neutral_100 CCCCC8
set -U theme_color_neutral_200 AAAAA6
set -U theme_color_neutral_250 888884
set -U theme_color_neutral_300 666662
set -U theme_color_neutral_400 444440
set -U theme_color_neutral_500 30302C

set -U theme_color_alert_red D42111
set -U theme_color_alert_orange FF8A04
set -U theme_color_alert_yellow F9C811
set -U theme_color_alert_green 00B100
set -U theme_color_alert_blue 055DF2

# the default color
# set fish_color_normal

# don't underline paths
set -U fish_color_valid_path normal

# the color for commands
set -U fish_color_command $theme_color_lemon_300

# the color for quoted blocks of text
set -U fish_color_quote $theme_color_lime_300

# the color for IO redirections
set -U fish_color_redirection $theme_color_azure_300

# the color for process separators like ';' and '&'
set -U fish_color_end $theme_color_rose_300

# the color used to highlight potential errors
set -U fish_color_error $theme_color_crimson_2git 00

# the color for regular command parameters
set -U fish_color_param normal

# the color used for code comments
set -U fish_color_comment $theme_color_neutral_400

# the color used to highlight matching parenthesis
set -U fish_color_match $theme_color_azure_400

# the color used when selecting text (in vi visual mode)
# set -U fish_color_selection

# used to highlight history search matches and the selected pager item (must be a background)
set -U fish_color_search_match "--background=$theme_color_sapphire_300" 'fff'

# the color for parameter expansion operators like '*' and '~'
set -U fish_color_operator normal

# the color used to highlight character escapes like '\n' and '\x70'
set -U fish_color_escape $theme_color_rose_300

# the color used for the current working directory in the default prompt
# set -U fish_color_cwd

# the color used for autosuggestions
set -U fish_color_autosuggestion $theme_color_neutral_400

# the color used to print the current username in some of fish default prompts
# set -U fish_color_user

# the color used to print the current host system in some of fish default prompts
# set -U fish_color_host

# the color for the '^C' indicator on a canceled command
set -U fish_color_cancel "--background=$theme_color_alert_red" 'brwhite'

# Additionally, the following variables are available to change the highlighting in the completion pager:

# the color of the progress bar at the bottom left corner
set -U fish_pager_color_progress "--background=$theme_color_neutral_500" "$theme_color_neutral_200"

# the background color of a line
# set -U fish_pager_color_background

# the color of the prefix string, i.e. the string that is to be completed
set -U fish_pager_color_prefix $theme_color_azure_200

# the color of the completion itself
set -U fish_pager_color_completion $theme_color_neutral_100

# the color of the completion description
set -U fish_pager_color_description $theme_color_neutral_300

# fish_pager_color_background of every second unselected completion. Defaults to fish_pager_color_background
# set -U fish_pager_color_secondary_background

# fish_pager_color_prefix of every second unselected completion. Defaults to fish_pager_color_prefix
# set -U fish_pager_color_secondary_prefix

# fish_pager_color_completion of every second unselected completion. Defaults to fish_pager_color_completion
# set -U fish_pager_color_secondary_completion

# fish_pager_color_description of every second unselected completion. Defaults to fish_pager_color_description
# set -U fish_pager_color_secondary_description

# fish_pager_color_background of the selected completion. Defaults to fish_color_search_match
set -U fish_pager_color_selected_background "--background=$theme_color_azure_400" "fff"

# fish_pager_color_prefix of the selected completion. Defaults to fish_pager_color_prefix
set -U fish_pager_color_selected_prefix $theme_color_azure_100

# fish_pager_color_completion of the selected completion. Defaults to fish_pager_color_completion
set -U fish_pager_color_selected_completion fff

# fish_pager_color_description of the selected completion. Defaults to fish_pager_color_description
set -U fish_pager_color_selected_description $theme_color_sapphire_100
