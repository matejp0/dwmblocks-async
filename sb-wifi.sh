#!/bin/dash

case "$BLOCK_BUTTON" in
  1) connman-gtk & ;;
esac

active=$(/usr/bin/connmanctl services | grep "*AR\|*AO" | grep "wifi")

if [ -n "$active" ]; then
  sname="$(echo $active | grep -oE '[^ ]+$')"
  name="$(/usr/bin/connmanctl services $sname | grep 'Name = ' | grep -oE '[^=]+$' | awk '{$1=$1};1')"
  strength="$(/usr/bin/connmanctl services $sname | grep 'Strength = ' | grep -oE '[^=]+$' | awk '{$1=$1};1')"
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
else
  echo "󰤮"
fi
