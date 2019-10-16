# LSCOLORS
#
# The value of this variable describes what color to use for which attribute when colors are
# enabled with CLICOLOR.  This string is a concatenation of pairs of the format fb, where f is
# the foreground color and b is the background color.
#
# The color designators are as follows:
#
#  a - black
#  b - red
#  c - green
#  d - brown
#  e - blue
#  f - magenta
#  g - cyan
#  h - light grey
#  A - bold black, usually shows up as dark grey
#  B - bold red
#  C - bold green
#  D - bold brown, usually shows up as yellow
#  E - bold blue
#  F - bold magenta
#  G - bold cyan
#  H - bold light grey; looks like bright white
#  x - default foreground or background
#
# Note that the above are standard ANSI colors.  The actual display may differ depending on
# the color capabilities of the terminal in use.
#
# The order of the attributes are as follows:
#
# 1.   directory
# 2.   symbolic link
# 3.   socket
# 4.   pipe
# 5.   executable
# 6.   block special
# 7.   character special
# 8.   executable with setuid bit set
# 9.   executable with setgid bit set
# 10.  directory writable to others, with sticky bit
# 11.  directory writable to others, without sticky bit
#
# The default is "exfxcxdxbxegedabagacad", i.e. blue foreground and default background for
# regular directories, black foreground and red background for setuid executables, etc.

function __lscolors_map --description "Maps Fish color names to LSCOLORS designators" --argument-names color_name
  switch $color_name
    case black;     printf 'a'
    case red;       printf 'b'
    case green;     printf 'c'
    case yellow;    printf 'd'
    case blue;      printf 'e'
    case magenta;   printf 'f'
    case cyan;      printf 'g'
    case white;     printf 'h'
    case brblack;   printf 'A'
    case brred;     printf 'B'
    case brgreen;   printf 'C'
    case bryellow;  printf 'D'
    case brblue;    printf 'E'
    case brmagenta; printf 'F'
    case brcyan;    printf 'G'
    case brwhite;   printf 'H'
    case '*';       printf 'x'
  end
end

function __lscolors_component --description "Builds an LSCOLORS attribute-pair from Fish colour names" --argument-names fg_color bg_color
  if test -z $bg_color; set bg_color 'default'; end

  printf '%s%s' (__lscolors_map $fg_color) (__lscolors_map $bg_color)
end

set --local directory                    (__lscolors_component yellow)
set --local symbolic_link                (__lscolors_component magenta)
set --local socket                       (__lscolors_component blue)
set --local pipe                         (__lscolors_component blue)
set --local executable                   (__lscolors_component green)
set --local block_special                (__lscolors_component blue cyan)
set --local character_special            (__lscolors_component blue yellow)
set --local executable_setuid            (__lscolors_component black red)
set --local executable_setgid            (__lscolors_component black cyan)
set --local directory_writable_sticky    (__lscolors_component black green)
set --local directory_writable_no_sticky (__lscolors_component black yellow)

set --export LSCOLORS (string join '' $directory \
                                      $symbolic_link \
                                      $socket \
                                      $pipe \
                                      $executable \
                                      $block_special \
                                      $character_special \
                                      $executable_setuid \
                                      $executable_setgid \
                                      $directory_writable_sticky \
                                      $directory_writable_no_sticky)
