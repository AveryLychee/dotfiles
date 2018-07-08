function m --argument file
	switch $file
case '*.pdf'
mupdf $file &
case '*'
mpv $argv
end
end
