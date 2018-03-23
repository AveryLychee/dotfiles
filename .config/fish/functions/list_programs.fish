# Defined in /tmp/fish.Ag5tdk/list_programs.fish @ line 2
function list_programs
	if [ (math (date +'%s') - (stat -c '%X' ~/.program_list)) -gt 43200 ]
		for folder in $PATH
			for exe in (find $folder -maxdepth 1 -mindepth 1 -executable)
				basename $exe
			end
		end | sort -u >~/.program_list
	end
	cat ~/.program_list
end
