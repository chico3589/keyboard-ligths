#!/bin/bash
OUTPUT=$(brightnessctl --list | grep -Eo "Device '.+::scrolllock" | sed -e "s/Device '//" -e "s/::scrolllock//")
CURRENT_BRIGHTNESS=$(brightnessctl --list | grep scrolllock -A 1 | grep -Eo "Current brightness: [0-9]" | grep -Eo "[0-9]")
if [ "$CURRENT_BRIGHTNESS" == "0" ]
then
    /usr/bin/brightnessctl --device="${OUTPUT}::scrolllock" set 1
else
    /usr/bin/brightnessctl --device="${OUTPUT}::scrolllock" set 0
fi
