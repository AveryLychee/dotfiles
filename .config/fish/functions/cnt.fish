function cnt
	if set -q Q2_MAP
q2map $Q2_MAP
yquake2 +map (cleanname (basename $Q2_MAP))
else
read -g -P "current map is not set, what do you want to use? " Q2_MAP
cnt $Q2_MAP
end
end
