function cleanname --argument filename
	echo $filename | sed 's/\..*//'
end
