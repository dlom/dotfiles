#!/bin/sh
start-pulseaudio-x11
1pass &
xset m 1 1
export EDITOR=subl
exec $1 >> ~/.cache/$1/stdout 2>> ~/.cache/$1/stderr
