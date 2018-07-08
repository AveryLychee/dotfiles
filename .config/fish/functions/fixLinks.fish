function fixLinks --argument htmlfile title
	if not set -q htmlfile
set_color red
echo -ne "ERROR: "
set_color normal
echo -ne "no file given"
return false
end

set style '<style>td { max-width:500px; }</style>'

sedq $htmlfile 's_<title.*$_<title>'$title'</title>_' 's_http[s|:].*$_<a href="&">link</a>_g' 's_<body>_'$style'<body>_'
end
