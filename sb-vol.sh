#!/bin/bash

case "$BLOCK_BUTTON" in
  1) pavucontrol & ;;
  2) /usr/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ ;;
  3) ~/.local/dwm/dwmblocks-async/rotate-sinks.sh;;
  4) /usr/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ ;;
  5) /usr/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- ;;
esac

volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
level=$(echo "$volume" | cut -d' ' -f2)
levelPercent=$(printf "%.0f" $(echo "$level * 100" | bc -l))

if [[ $volume == *"MUTED"* ]]; then
  color="^c#777788^"
elif [[ $levelPercent -gt 100 ]]; then
  color="^c#ff6969^"
else
  color="^c#ff8869^"
fi


if [[ $levelPercent -gt 50 ]]; then
  symbol=" "
else
  symbol=""
fi



# muted=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -c MUTED && echo '^c#ff5555^ ^d^' || echo ''", 0, 5) \
#    X("", "wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut -d' ' -f2", 0, 5) \

echo "$color$symbol $levelPercent^d^"
