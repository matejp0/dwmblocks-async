#!/bin/dash

case "$BLOCK_BUTTON" in
  1) easyeffects --service-mode & ;;
  3) easyeffects --bypass-toggle ;;
esac

readonly status=$(easyeffects --bypass 3)

if [ "$status" = 1 ]; then
  color="^c#777788^"
else
  color="^c#2FEE75^"
fi

symbol="󰺢"

echo "$color$symbol^d^"
