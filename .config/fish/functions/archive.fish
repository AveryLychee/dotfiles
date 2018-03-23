function archive
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
