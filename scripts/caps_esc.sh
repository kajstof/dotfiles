#!/usr/bin/env bash

# xmodmap -e "clear lock" #disable caps lock switch
# xmodmap -e "keysym Caps_Lock = Escape" #set caps_lock as escape

setxkbmap -option caps:escape
