ibus-daemon -d -x
export EDITOR=/usr/bin/micro
export BROWSER=firedragon
export TERM=kitty
export MAIL=thunderbird
export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

bash -c 'sleep 2 ; setxkbmap -layout us,ru -option grp:shifts_toggle'&
bash -c 'sleep 3 ; xset r rate 170 50' &
# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/r/.lmstudio/bin:/opt/cuda/bin"
# End of LM Studio CLI section

