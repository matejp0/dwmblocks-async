#!/bin/dash

case "$BLOCK_BUTTON" in
  1) ~/.local/share/dwm/dwmblocks-async/change-kblayout.sh ;;
esac

status="$(setxkbmap -query | grep layout | awk '{ print $2 }')"

echo "$status"

