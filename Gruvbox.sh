#!/usr/bin/env bash

## Dirs #############################################
terminal_path="$HOME/.config/xfce4/terminal"
geany_path="$HOME/.config/geany"

# wallpaper ---------------------------------
set_wall() {
	SCREEN=`xrandr --listactivemonitors | awk -F ' ' 'END {print $1}' | tr -d \:`
	MONITOR=`xrandr --listactivemonitors | awk -F ' ' 'END {print $2}' | tr -d \*+`
	xfconf-query --channel xfce4-desktop --property /backdrop/screen${SCREEN}/monitor${MONITOR}/workspace0/last-image --set /usr/share/archcraft/wallpapers/"${1}"
}

# xfce terminal ---------------------------------
change_xfterm () {
	sed -i -e "s/FontName=.*/FontName=$1/g" "$terminal_path"/terminalrc
	sed -i -e 's/ColorForeground=.*/ColorForeground=#ebdbb2/g' "$terminal_path"/terminalrc
	sed -i -e 's/ColorBackground=.*/ColorBackground=#1d2021/g' "$terminal_path"/terminalrc
	sed -i -e 's/ColorCursor=.*/ColorCursor=#d65bc4cd8ca1/g' "$terminal_path"/terminalrc
	sed -i -e 's/ColorPalette=.*/ColorPalette=#1d2021;#cc241d;#98971a;#d79921;#458588;#b16286;#689d6a;#a89984;#928374;#fb4934;#b8bb26;#fabd2f;#83a598;#d3869b;#8ec07c;#ebdbb2/g' "$terminal_path"/terminalrc
}

# to be added
# geany ---------------------------------
# change_geany() {
# 	sed -i -e "s/color_scheme=.*/color_scheme=$1.conf/g" "$geany_path"/geany.conf
# 	sed -i -e "s/editor_font=.*/editor_font=$2/g" "$geany_path"/geany.conf
# }

# gtk theme, icons and fonts ---------------------------------
change_gtk() {
	xfconf-query -c xfwm4 -p /general/theme -s "${1}"
	xfconf-query -c xsettings -p /Net/ThemeName -s "${2}"
	xfconf-query -c xsettings -p /Net/IconThemeName -s "${3}"
	xfconf-query -c xsettings -p /Gtk/CursorThemeName -s "${4}"
	xfconf-query -c xsettings -p /Gtk/FontName -s "${5}"
}

# notify ---------------------------------
notify_user () {
	local style=`basename $0` 
	notify-send -u normal -i /usr/share/icons/Archcraft/actions/24/channelmixer.svg "Applying Style : ${style%.*}"
}

## Execute Script -----------------------
notify_user

set_wall 'Gruvbox.jpg'																			# WALLPAPER

## Change colors in funct (xfce4-terminal)
change_xfterm 'Iosevka Custom 9'																# FONT

# change_geany 'default' 'Iosevka Custom 10'														# SCHEME | FONT

change_gtk 'gruvbox' 'gruvbox' 'gruvbox' 'Archcraft-Cursor' 'Noto Sans 9'						# WM THEME | THEME | ICON | CURSOR | FONT
