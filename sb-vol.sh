#!/bin/bash

case "$BLOCK_BUTTON" in
  1) pavucontrol & ;;
  2) /usr/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ ;;
  3) ~/.local/dwm/dwmblocks-async/rotate-sinks.sh;;
  4) /usr/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ ;;
  5) /usr/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- ;;
esac

volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
if [[ $volume == *"MUTED"* ]]; then
  symbol="^c#777788^ "
else
  symbol="^c#ff8869^ "
fi

level=$(echo "$volume" | cut -d' ' -f2)

# muted=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -c MUTED && echo '^c#ff5555^ ^d^' || echo ''", 0, 5) \
#    X("", "wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut -d' ' -f2", 0, 5) \

echo "$symbol $level^d^"
