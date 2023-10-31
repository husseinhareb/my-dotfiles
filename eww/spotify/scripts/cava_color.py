from PIL import Image
from collections import Counter

def most_dominant_color(image_path):
    # Open the image using Pillow
    image = Image.open(image_path)

    # Convert the image to the RGB mode
    image = image.convert("RGB")

