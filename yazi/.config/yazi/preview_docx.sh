pandoc $1 -f docx -t pdf -o - | pdftoppm | wezterm imgcat
