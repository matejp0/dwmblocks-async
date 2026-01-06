#!/bin/dash

case "$BLOCK_BUTTON" in
  1) /usr/bin/arandr & ;;
  4) /usr/bin/brightnessctl -q set 5%+ ;;
  5) /usr/bin/brightnessctl -q set 5%- ;;
esac

readonly level=$(/usr/bin/brightnessctl get)

readonly color="^c#ffcc69^"
if [ "$level" -le 33 ]; then
  symbol="󰃞"
elif [ "$level" -le 66 ]; then
  symbol="󰃟"
else
  symbol="󰃠"
fi


echo "$color$symbol $level^d^"
