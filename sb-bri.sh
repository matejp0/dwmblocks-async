#!/bin/dash

case "$BLOCK_BUTTON" in
  1) /usr/bin/arandr & ;;
esac

level="$(/usr/bin/xbacklight -get)"

if [ "$level" -le 33 ]; then
  symbol="^c#ffcc69^󰃞"
elif [ "$level" -le 66 ]; then
  symbol="^c#ffcc69^󰃟"
else
  symbol="^c#ffcc69^󰃠"
fi


echo "$symbol $level^d^"
