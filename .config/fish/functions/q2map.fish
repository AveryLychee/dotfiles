# Defined in /tmp/fish.ooWVF2/q2map.fish @ line 1
function q2map --argument map_name
	pushd /home/avery/Downloads/q2map/
./qbsp3 "$map_name"
./qvis3 "$map_name"
./qrad3 "$map_name"
set bsp (echo "$map_name" | sed 's/map$/bsp/')
cp "$bsp" /home/avery/.yq2/baseq2/maps/
popd
end
