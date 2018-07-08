function mkpdf --argument file
	pandoc --standalone $file -o (cleanname $file).html
wkhtmltopdf -B 0 -L 0 -R 0 -T 0 (cleanname $file).html (cleanname $file).pdf
end
