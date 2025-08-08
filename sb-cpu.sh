#!/bin/dash

temp=$(acpi -t | awk '{print $4}')
temperature=$(printf "%.0f" "$temp")

echo "^c#68ff6d^ $temperature^d^"
