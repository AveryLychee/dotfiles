# Defined in /tmp/fish.9cYPfH/convert_to_dynamic.fish @ line 2
function convert_to_dynamic --argument colorscheme
	cat $colorscheme.* | sed 's/!/#/' | sed 's/^.*\*\.*//' | sed 's/: */="/' | sed 's/$/"/' | sed 's/^"$//' | sed 's/highlightColor/highlight/' >~/.dynamic-colors/colorschemes/$colorscheme.sh
end
