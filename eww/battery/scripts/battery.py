import subprocess
def create_responsive_art(percentage):
    if not (0 <= percentage <= 100):
        raise ValueError("Percentage must be between 0 and 100")

    filled_chars = int((percentage / 100) * 20)

    art = [
        "╔════════════════════╗",
        f"║{'█' * filled_chars}{'░' * (20 - filled_chars)}╚╗",
        f"║{'█' * filled_chars}{'░' * (20 - filled_chars)} ║",
        f"║{'█' * filled_chars}{'░' * (20 - filled_chars)}╔╝",
        "╚════════════════════╝"
    ]

    for line in art:
        print(line)



bash_command = "upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep 'percentage' | awk '{print $2}'"

completed_process = subprocess.run(bash_command, shell=True, capture_output=True, text=True)

battery_percentage = completed_process.stdout.strip()

battery_int = battery_percentage.replace('%','')
current_battery = int(battery_int)


create_responsive_art(current_battery)
