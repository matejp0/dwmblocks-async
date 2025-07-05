#!/bin/dash

ALL=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors)
nAll=$(echo "$ALL" | wc -w)
CURRENT=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)
position=$(echo "$ALL" | tr " " "\n" | grep -n "$CURRENT" | cut -d: -f1)

nextPos=$(( position % nAll + 1 ))

nextGovernor=$(echo "$ALL" | cut -d " " -f "$nextPos")
echo "current $CURRENT next $nextGovernor"

sudo cpufreq-set -r -g $nextGovernor && dunstify -r 2 "CPU Governor" "$nextGovernor" || dunstify -r 2 "Failed to change CPU Governor"
