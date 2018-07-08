# Defined in /tmp/fish.414Zqk/game.fish @ line 2
function game --argument name
	switch $name
		case mm
			/storio/Games/GOG\ Games/Mini\ Metro/start.sh 
		case dust
			/storio/Games/GOG\ Games/Dustforce\ DX/start.sh
		case mw
			set -x LD_LIBRARY_PATH ~/.libgl-shim
			openmw-launcher
		case nlmw
			set -x DRI_PRIME 1
			set -x LD_LIBRARY_PATH ~/.libgl-shim
			openmw
		case ws
			set -x DRI_PRIME 1
			wine ~/.wine/drive_c/Program\ Files/Steam/Steam.exe
		case st
			set -x DRI_PRIME 1
			steam
		case sir
			set -x DRI_PRIME 1
			/storio/Games/Sir_You_Are_Being_Hunted/launcher/sir
		case mc
			set -x DRI_PRIME 1
			MultiMC
	end
end
