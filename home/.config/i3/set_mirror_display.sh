#!/bin/bash
HDMI_MONITOR="HDMI-0"
DP_MONITOR="DP-0"
LAPTOP_MONITOR="DP-4"

# Check if the ultrawide monitor is connected
if xrandr | grep -q "$HDMI_MONITOR connected"; then
    # Ultrawide is connected: Use ultrawide only, turn off laptop screen
    xrandr --output "$HDMI_MONITOR" --mode 3440x1440 --rate 100 --output "$LAPTOP_MONITOR" --off
elif xrandr | grep -q "$DP_MONITOR connected"; then
    xrandr --output "$DP_MONITOR" --mode 3440x1440 --rate 180 --output "$LAPTOP_MONITOR" --off
else
    # Ultrawide is NOT connected: Use laptop screen only
    xrandr --output "$LAPTOP_MONITOR" --auto --output "$HDMI_MONITOR" --off
fi

# xrandr --output HDMI-0 --mode 3440x1440 --rate 100 --output DP-4 --off
# xrandr --output DP-4 --brightness 0.8
