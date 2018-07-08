function smap
	if test (count $argv) -lt 2
echo "smap requires at least 2 arguments"
else
set -l f $argv[1]
for x in $argv[2..-1]
eval $f $x
end
end
end
