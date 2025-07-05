#!/bin/dash

readonly current=$(cat /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode)

if [ "$current" = 0 ]; then
  sudo echo 1 > /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode && dunstify -r 11 "Conservation mode" "on"
elif [ "$current" = 1 ]; then
  sudo echo 0 > /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode && dunstify -r 11 "Conservation mode" "off"
fi
