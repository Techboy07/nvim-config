#!/bin/bash

# Get coordinates from wl-kbptr
coords=$(/usr/bin/wl-kbptr --only-print)

# Initialize variables
x=""
y=""

# Primary regex parser
if [[ "$coords" =~ \+([0-9]+)\+([0-9]+) ]]; then
    x="${BASH_REMATCH[1]}"
    y="${BASH_REMATCH[2]}"
else
    # Fallback parser if layout differs
    IFS='+' read -r _ x y _ <<< "$coords"
    x=$(echo "$x" | grep -oE '[0-9]+')
    y=$(echo "$y" | grep -oE '[0-9]+')
fi

# Execute actions if coordinates were successfully found
if [[ -n "$x" && -n "$y" ]]; then
    /usr/bin/wdotool mousemove "$x" "$y"
    /usr/bin/wdotool click 1
else
    echo "Error: Could not parse coordinates from output: $coords"
fi
