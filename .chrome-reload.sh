#!/bin/bash
RELOAD_KEYS="CTRL+R"
#RELOAD_KEYS="SHIFT+CTRL+R"

# get which window is active right now
MYWINDOW=$(xdotool getactivewindow)

xdotool search --class google-chrome windowactivate --sync
xdotool search --class google-chrome key --clearmodifiers ${RELOAD_KEYS}

# sometimes the focus doesn't work, so follow up with activate
xdotool windowfocus ${MYWINDOW}
xdotool windowactivate ${MYWINDOW}
