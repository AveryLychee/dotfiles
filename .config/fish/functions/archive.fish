# Defined in /tmp/fish.lXpp1n/archive.fish @ line 2
function archive
	if [ (count $argv) -eq 1 ]
		set folder ./.archive/(date '+%y-%m-%d')
		mkdir -p $folder
		mv $argv[1] $folder
	else
		echo -e "Are you sure you want to archive\033[1m" (pwd) "\033[0m? [y/N]"
		read response
		switch  "$response"
			case y
				echo "archiving..."
				set folder ./.archive/(date '+%y-%m-%d')
				mkdir -p $folder
				mv ./* "$folder"
			case *			
				echo "cancelled"
		end
	end
end
