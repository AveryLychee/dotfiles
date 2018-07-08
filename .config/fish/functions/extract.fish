# Defined in /tmp/fish.3tkHpk/extract.fish @ line 2
function extract --argument archive
	switch $archive
case '*tar'
tar xzf $archive --one-top-level
case *zip
unzip $archive -d (cleanname $archive)
case *7z
7z x $archive
end
end
