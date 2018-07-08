# Defined in /tmp/fish.4azdSx/dwr.fish @ line 2
function dwr
	set --local number 1
set --local total (find -maxdepth 1 -type f -name '*.mp4' | wc -l)
set --local story_name (basename (pwd))
for file in *.mp4
echo "$file --> $story_name [$number of $total].mp4"
set number (math $number + 1)
end

set number 1

if yesno "Approve?"
for file in *.mp4
mv "$file" "$story_name [$number of $total].mp4"
set number (math $number + 1)
end
end
end
