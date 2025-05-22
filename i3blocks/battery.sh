#!/bin/bash

BAT=$(acpi -b | grep -E -o '[0-9]{1,3}%')

# Full and short texts
echo "$BAT"
echo "$BAT"

# Set urgent flag below 5% or use orange below 20%
[ ${BAT%?} -le 5 ] && exit 33
[ ${BAT%?} -le 20 ] && echo "#FF8000"

# Set green if 100%
[ ${BAT%?} -eq 100 ] && echo "#00FF00"

exit 0
