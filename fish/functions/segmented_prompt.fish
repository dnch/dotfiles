function segmented_prompt
  set segmented_prompt_group_color 555
  set segmented_prompt_group_start "[ "
  set segmented_prompt_group_end " ]"
  set segmented_prompt_group_divider " | "

  # Build up a list of items to show in the right prompt
  set segmented_prompt_elements $argv

  # and as long as we have at least one...
  if test (count $segmented_prompt_elements) -gt 0
    # open the group
    set_color $segmented_prompt_group_color
    echo -n $segmented_prompt_group_start

    # print all of them (except for the last) with a
    for element in $segmented_prompt_elements[1..-2]
      echo -n $element
      set_color $segmented_prompt_group_color
      echo -n $segmented_prompt_group_divider
    end

    # print our last element (without the trailing divider)
    echo -n $segmented_prompt_elements[-1]

    # and close the group
    set_color $segmented_prompt_group_color
    echo -n $segmented_prompt_group_end
    set_color normal
  end
end
