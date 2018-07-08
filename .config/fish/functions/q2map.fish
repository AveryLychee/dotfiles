# Defined in /tmp/fish.BnHvmn/q2map.fish @ line 2
function q2map --argument map_name
	qbsp3 "$map_name"
	qvis3 "$map_name"
	qrad3 "$map_name"
	set bsp (echo "$map_name" | sed 's/map$/bsp/')
	cp "$bsp" /home/avery/.yq2/baseq2/maps/
end
