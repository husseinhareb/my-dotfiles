from PIL import Image
from collections import Counter

def most_dominant_color(image_path):
    # Open the image using Pillow
    image = Image.open(image_path)

    # Convert the image to the RGB mode
    image = image.convert("RGB")

    # Resize the image to a smaller size for faster processing (optional)
    image = image.resize((100, 100))

    # Get the pixels as a list of RGB tuples
    pixels = list(image.getdata())

    # Count the occurrences of each color in the image
    color_counts = Counter(pixels)

    # Find the most common color
    dominant_color = color_counts.most_common(1)[0][0]

    # Convert the dominant color to a hexadecimal code
    hex_color = "#{:02X}{:02X}{:02X}".format(dominant_color[0], dominant_color[1], dominant_color[2])

    return hex_color

# Replace 'your_image.jpg' with the path to your image file
image_path = '/home/shtam/.config/eww/spotify/scripts/spotify/image.jpg'
dominant_color = most_dominant_color(image_path)
print(dominant_color)
