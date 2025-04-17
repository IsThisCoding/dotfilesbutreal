#!/bin/bash

# Check if brightnessctl is installed
if ! command -v brightnessctl &> /dev/null; then
    echo "Error: brightnessctl is not installed. Please install it and try again."
    exit 1
fi

# Get the current brightness percentage
current_brightness=$(brightnessctl -q g)
max_brightness=$(brightnessctl -q m)
current_percentage=$((current_brightness * 100 / max_brightness))

# Adjust brightness based on the argument
case $1 in
    up)
        if [ "$current_percentage" -lt 10 ]; then
            brightnessctl -q set 1%+
        else
            brightnessctl -q set 5%+
        fi
        ;;
    down)
        if [ "$current_percentage" -le 10 ]; then
            brightnessctl -q set 1%-
        else
            brightnessctl -q set 5%-
        fi
        ;;
    *)
        echo "Usage: $0 {up|down}"
        exit 1
        ;;
esac

# Display the updated brightness
new_percentage=$(brightnessctl -q g | awk -v max="$max_brightness" '{printf "%d", $1 * 100 / max}')
echo "Brightness adjusted to $new_percentage%"

