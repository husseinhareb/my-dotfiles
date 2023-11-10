nbr_of_cycles=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "charge-cycles" | awk '{print $2}')
percentage=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "percentage" | awk '{print $2}')
energy=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "energy:" | awk '{print $2}')
energy_rate=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "energy-rate:" | awk '{print $2}')
state=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "state:" | awk '{print $2}')

echo $nbr_of_cycles
echo $percentage
echo $energy
echo $energy_rate
echo $state