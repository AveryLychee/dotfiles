function yesno --argument string
	read -P $string yn
switch $yn
case y
true
case Y
true
case '*'
false
end
end
