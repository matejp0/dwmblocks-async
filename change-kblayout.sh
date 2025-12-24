#!/bin/dash

setxkbmap -query | grep -q 'us' && setxkbmap -layout cz -variant qwerty || setxkbmap us; pkill -RTMIN+11 dwmblocks &
