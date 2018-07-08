function watch_from --argument n
	mpv Open*$n *; and watch_from (math "$n + 1")
end
