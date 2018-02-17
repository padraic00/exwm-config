# Disable access control
xhost +SI:localuser:$USER

# Themes, etc
gnome-settings-daemon &

# Fallback cursor
xsetroot -cursor_name left_ptr

# Keyboard repeat rate
xset r rate 200 60

# Start Emacs
set -- $(cat /proc/cmdline)
for x in "$@"; do
    case "$x" in
	video=*)
        if [ "1920x1080" = ${x//video=} ]; then
	    xrandr --newmode "1920x1080_60.00"  172.80  1920 2040 2248 2576  1080 1081 1084 1118
	    xrandr --addmode VGA-1 1920x1080_60.00
	    xrandr --output VGA-1 --mode 1920x1080_60.00
	elif [ "2560x1440" = ${x//video=} ]; then
	    xrandr --newmode "2560x1440"  312.25  2560 2752 3024 3488  1440 1443 1448 1493
	    xrandr --addmode VGA-1 2560x1440
	    xrandr --output VGA-1 --mode 2560x1440
	else
	    xrandr --newmode "1440x2560"  318.00  1440 1568 1720 2000  2560 2563 2573 2651
	    xrandr --addmode VGA-1 1440x2560
	    xrandr --output VGA-1 --mode 1440x2560
	fi
	;;
    esac
done
dbus-launch --exit-with-session emacs
