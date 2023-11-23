from PIL import Image
from collections import Counter

def most_dominant_color(image_path):
    try:
        # Open the image using Pillow
        with Image.open(image_path) as image:
            # Convert the image to the RGB mode
            image = image.convert("RGB")

            # Resize the image while maintaining aspect ratio
            max_size = (100, 100)
            image.thumbnail(max_size)

            # Get the pixels as a list of RGB tuples
            pixels = list(image.getdata())

            # Count the occurrences of each color in the image
            color_counts = Counter(pixels)

            # Find the most common color
            dominant_color = color_counts.most_common(1)[0][0]

            # Convert the dominant color to a hexadecimal code
            hex_color = "#{:02X}{:02X}{:02X}".format(dominant_color[0], dominant_color[1], dominant_color[2])

            return hex_color
    except (FileNotFoundError, OSError, AttributeError, TypeError, ZeroDivisionError) as e:
        print(f"Error: {e}")
        return None

# Replace 'your_image.jpg' with the path to your image file
image_path = '/home/shtam/.config/eww/spotify/scripts/image.png'
dominant_color = most_dominant_color(image_path)
if dominant_color:
    print(dominant_color)
