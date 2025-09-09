#!/bin/dash

case "$BLOCK_BUTTON" in
  1) alacritty -e nmtui & ;;
esac

name=$(/usr/bin/nmcli d | grep -m 1 "wifi" | awk '{print $4}')

if [ "$name" = "--" ]; then
  echo "󰤮"
else
  strength="$(/usr/bin/nmcli dev wifi list | grep -i '^\*' | awk '{print $8}')"
  if [ "$strength" -le 30 ]; then
    symbol="󰤟"
  elif [ "$strength" -le 60 ]; then
    symbol="󰤢"
  elif [ "$strength" -le 90 ]; then
    symbol="󰤥"
  else
    symbol="󰤨"
  fi
  echo "^c#69bbff^$symbol $name^d^"
fi
