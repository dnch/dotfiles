function git_prompt_details
	if test -n (git_branch_name)
		echo (set_color ca0)(git_branch_name)(set_color normal)(git_dirty_status)
	end
end
