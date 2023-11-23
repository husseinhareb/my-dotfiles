nbr_of_cycles=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "charge-cycles" | awk '{print $2}')
percentage=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "percentage" | awk '{print $2}')
energy=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "energy:" | awk '{print $2}')
energy_rate=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "energy-rate:" | awk '{print $2}')
state=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "state:" | awk '{print $2}')

if [ "$1" == "--cycles" ]; then 
  echo "|Cycles: $nbr_of_cycles"
fi
if [ "$1" == "--perc" ]; then 
  echo "|Percentage: $percentage"
fi
if [ "$1" == "--energy" ]; then 
  echo "|Energy: $energy Wh"
fi
if [ "$1" == "--rate" ]; then 
  echo "|Energy rate: $energy_rate Wh"
fi
if [ "$1" == "--state" ]; then 
  echo "|State: $state"
fi
