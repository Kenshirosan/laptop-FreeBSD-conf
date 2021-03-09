#!/bin/sh
# $Xorg: xinitrc.cpp,v 1.3 2000/08/17 19:54:30 cpqbld Exp $
export LC_ALL=en_US.UTF-8

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/usr/local/lib/X11/xinit/.Xresources
sysmodmap=/usr/local/lib/X11/xinit/.Xmodmap
export PATH=${PATH}:~/scripts

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# ICONS WM
sed -i '' -E "s%\/home\/[a-zA-Z0-9_-]+\/%\/home\/${USER}\/%g" ~/.config/openbox/menu.xml
sed -i '' -E "s%\/home\/[a-zA-Z0-9_-]+\/%\/home\/${USER}\/%g" ~/.config/openbox/rc.xml

# ICONS TINT2
sed -i '' -E "s%\/home\/[a-zA-Z0-9_-]+\/%\/home\/${USER}\/%g" ~/.tint2rc

# ICONS APPS
#for I in ~/.apps/*.desktop
#   do
#        sed -i '' -E "s%\/home\/[a-zA-Z0-9_-]+\/%\/home\/${USER}\/%g" "${I}"
#    done
#~/scripts/__openbox_restart_dzen2.sh &
exec setxkbmap fr &
exec $1
# /usr/local/bin/start-lumina-desktop
