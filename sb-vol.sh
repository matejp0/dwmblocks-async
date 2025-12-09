#!/bin/dash

case "$BLOCK_BUTTON" in
  1) pavucontrol & ;;
  2) /usr/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ ;;
  3) ~/.local/share/dwm/dwmblocks-async/rotate-sinks.sh;;
  4) /usr/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ ;;
  5) /usr/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- ;;
esac

readonly volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
readonly muted=$(echo "$volume" | awk '{print $3}')
readonly level=$(echo "$volume" | cut -d' ' -f2)
readonly levelPercent=$(printf "%.0f" $(echo "$level * 100" | bc -l))

if [ "$muted" = "[MUTED]" ]; then
  color="^c#777788^"
elif [ "$levelPercent" -gt 100 ]; then
  color="^c#ff6969^"
else
  color="^c#ff8869^"
fi


if [ "$levelPercent" -gt 50 ]; then
  symbol=" "
else
  symbol=""
fi

echo "$color$symbol $levelPercent^d^"
