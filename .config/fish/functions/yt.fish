# Defined in /tmp/fish.4zGimw/yt.fish @ line 2
function yt --argument command url
	touch ~/.yt_list
	set --local video $url
	switch $command
		case add
			echo "adding $url"
			echo "$video" >>~/.yt_list
		case get
			echo "getting next video..."
			set --local list_length (wc -l ~/.yt_list | cut -d' ' -f1)
			if [ $list_length -eq 0 ]
				echo "No more videos!"
				return 32
			end

			set video (head -1 ~/.yt_list)
			youtube-dl "$video"; and tail -n +2 ~/.yt_list >~/.yt_list.tmp; and mv ~/.yt_list.tmp ~/.yt_list
			and if test (count $argv) -gt 1
				yt get all; or return 32
			end
		case list
			if test (wc -l ~/.yt_list | cut -d' ' -f1) -gt 0
				if test (count $argv) -gt 1
					cat ~/.yt_list
				else
					cat ~/.yt_list | xargs youtube-dl --get-title
				end
			end
		case '*'
			echo "Usage:"
			echo "       yt add video : add a video to the list"
			echo "       yt get       : get a video from the list"
			echo "       yt get all   : get every video from the list"
			echo "       yt list      : output the titles of every video in the list"
			echo "       yt list urls : output the urls of every video in the list (doesn't use internet, fast)"
	end
end
