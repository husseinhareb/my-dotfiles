def create_responsive_art(percentage):
    if not (0 <= percentage <= 100):
        raise ValueError("Percentage must be between 0 and 100")

    # Calculate the number of characters to fill based on the percentage
    filled_chars = int((percentage / 100) * 20)

    # Create the responsive ASCII art
    art = [
        "╔════════════════════╗",
        f"║{'█' * filled_chars}{'░' * (20 - filled_chars)}╚╗",
        f"║{'█' * filled_chars}{'░' * (20 - filled_chars)} ║",
        f"║{'█' * filled_chars}{'░' * (20 - filled_chars)}╔╝",
        "╚════════════════════╝"
    ]

    # Print the responsive ASCII art
    for line in art:
        print(line)

# Example usage:
percentage_variable = 10
create_responsive_art(percentage_variable)
