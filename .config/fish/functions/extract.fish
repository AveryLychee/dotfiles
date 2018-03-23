function extract --argument archive
	switch $archive
case *tar*
tar xzf $archive --one-top-level
case *zip
unzip $archive -d (cleanname $archive)
end
end
