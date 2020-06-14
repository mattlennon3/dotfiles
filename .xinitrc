#!/bin/sh

# This should to be at the top of the file
# https://wiki.archlinux.org/index.php/NVIDIA_Optimus#Use_NVIDIA_graphics_only
xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto


userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

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

# Set keyboard to GB
# TODO: Set keyboard make & model
setxbkmap -layout gb

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Add personal scripts to path
if [ -d "$HOME/scripts/path" ] ; then
  PATH=$PATH:$HOME/scripts/path
fi

export EDITOR="nano"
export FILE_MANAGER="pcmanfm"

# Spotify wm_class fix
# https://github.com/dasJ/spotifywm
# https://www.reddit.com/r/awesomewm/comments/bztj1c/spotify_and_raise_or_spawn/
# export LD_PRELOAD=/usr/lib/libcurl-gnutls.so.3:/home/matt/builds/spotifywm/spotifywm.so /usr/bin/spotify

exec awesome

#twm &
#xclock -geometry 50x50-1+1 &
#xterm -geometry 80x50+494+51 &
#xterm -geometry 80x20+494-0 &
#exec xterm -geometry 80x66+0+0 -name login
