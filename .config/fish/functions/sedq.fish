function sedq
	set filename $argv[1]
for sedstring in $argv
if [ $sedstring = $filename ]
# do nothing
else
cat "$filename" | sed $sedstring >~/.sedq.tmp
and mv ~/.sedq.tmp $filename
end
end
end
