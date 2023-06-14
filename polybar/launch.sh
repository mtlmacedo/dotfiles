dir="$HOME/.config/polybar"
themes=(`ls --hide="launch.sh" $dir`)

launch_bar() {

	killall -q polybar
	while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
	polybar -q main -c "$dir/$style/config.ini" &
}

if [[ "$1" == "-themes" ]]; then
	cat <<- EOF
	Usage : launch.sh --theme

	Available Themes :
	echo $ls -d ~/.config/polybar
	EOF
elif [[ "$1" == "-h" || "$1" == "-help" ]]; then
	cat <<- EOF
	Usage : launch.sh --theme

	Commands :

	-themes : Show Available Themes
	-h | -help : help
	--{THEME}: run the selected theme

	EOF
elif [[ "$1" != "" || "$1" != " " ]]; then
	style="${1:2}"
	launch_bar
fi
