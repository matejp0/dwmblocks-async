#!/bin/bash

case "$BLOCK_BUTTON" in
  1) ~/.local/share/dwm/dwmblocks-async/change-governor.sh;;
  3) ~/.local/share/dwm/dwmblocks-async/toggle-conservation-mode.sh;;
esac

readonly NAME="BAT1"
readonly status="$(cat /sys/class/power_supply/$NAME/status)"
readonly level="$(cat /sys/class/power_supply/$NAME/capacity)"

if [ "$status" == "Discharging" ]; then
  if [ "$level" -le 15 ]; then
    symbol="^c#ff5555^󰂎"
  elif [ "$level" -le 30 ]; then
    symbol="󱊡"
  elif [ "$level" -le 60 ]; then
    symbol="󱊢"
  else
    symbol="󱊣"
  fi
elif [ "$status" == "Charging" ]; then
  if [ "$level" -le 15 ]; then
    symbol="^c#69e8ff^󰢟"
  elif [ "$level" -le 30 ]; then
    symbol="^c#69e8ff^󱊤"
  elif [ "$level" -le 60 ]; then
    symbol="^c#69e8ff^󱊥"
  else
    symbol="^c#69e8ff^󱊦"
  fi
else
  if [ "$level" -le 15 ]; then
    symbol="^c#69e8ff^󰂎"
  elif [ "$level" -le 30 ]; then
    symbol="^c#69e8ff^󱊡"
  elif [ "$level" -le 60 ]; then
    symbol="^c#69e8ff^󱊢"
  else
    symbol="^c#69e8ff^󱊣"
  fi
fi


echo "$symbol $level^d^"
