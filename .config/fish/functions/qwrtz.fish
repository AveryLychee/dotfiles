function qwrtz
	# check for if the mode is set
if not set -q qwrtz_mode
echo "error: to be done"
return 1
end
# check which mode we're in
switch "$qwrtz_mode"
case stopped
set --global qwrtz_start_time (date '+%s')
set --global qwrtz_readable_start_time (date)
set --global qwrtz_mode running
echo "qwrtz started at $qwrtz_readable_start_time."
case running
set --local stop_time (date '+%s')
set --local time_taken (math $stop_time - $qwrtz_start_time)
set --global qwrtz_mode stopped
echo "qwrtz stopped."
echo "time taken: $time_taken seconds."
cat ~/.qwrtz/categories 2>/dev/null 
echo " 0   (add a new category)"
read -P "choose a category: " cat_choice
if [ $cat_choice -eq 0 ]
read -P "category name: " name
set cat_choice (math (wc -l ~/.qwrtz/categories | cut -d' ' -f1) + 1)
echo " $cat_choice   $name" >>~/.qwrtz/categories
end
read -P "task description: " desc
echo "$qwrtz_start_time,$stop_time,$cat_choice,$desc" >>~/.qwrtz/database 
end
end
