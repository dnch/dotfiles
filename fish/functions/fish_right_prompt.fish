function fish_right_prompt
  set right_prompt_group_color 777
  set right_prompt_group_start "[ "
  set right_prompt_group_end " ]"
  set right_prompt_group_divider " | "

  # Build up a list of items to show in the right prompt
  set -a right_prompt_elements (dotfiles_display_status)
  set -a right_prompt_elements (git_prompt_details)
  set -a right_prompt_elements (current_ruby_version)

  # and as long as we have at least one...
  if test (count $right_prompt_elements) -gt 0
    # open the group
    set_color $right_prompt_group_color
    echo -n $right_prompt_group_start

    # print all of them (except for the last) with a
    for element in $right_prompt_elements[1..-2]
      set_color normal
      echo -n $element
      set_color $right_prompt_group_color
      echo -n $right_prompt_group_divider
    end

    # print our last element (without the trailing divider)
    set_color normal
    echo -n $right_prompt_elements[-1]

    # and close the group
    set_color $right_prompt_group_color
    echo -n $right_prompt_group_end
    set_color normal
  end
end
