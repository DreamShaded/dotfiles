ibus-daemon -d -x
export EDITOR=/usr/bin/mousepad
export MAIL=thunderbird
export QT_QPA_PLATFORMTHEME="qt5ct"

bash -c 'sleep 2 ; setxkbmap -layout us,ru -option grp:shifts_toggle'&
bash -c 'sleep 3 ; xset r rate 170 50' &


export PATH="$HOME/common/llm/local-brain/bin:$PATH"
