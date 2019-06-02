function git_dirty_status
	if [ -z (command git status --porcelain ^/dev/null | tail -n1) ]
		echo (set_color 9c3)" ±"(set_color normal)
	else
		echo (set_color c03)" ±"(set_color normal)
	end
end
