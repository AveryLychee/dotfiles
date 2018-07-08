function add_to_path --argument directory
	set -U fish_user_paths "$directory" $fish_user_paths
end
