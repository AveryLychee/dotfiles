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
youtube-dl "$video"; and cat ~/.yt_list | tail -(math $list_length - 1) >~/.yt_list
end
end
