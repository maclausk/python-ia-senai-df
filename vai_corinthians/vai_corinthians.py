import string
import random
import time

lowercase_letters = string.ascii_lowercase
vai_corinthians = "vai, corinthians!"
final_word = ""

for letter in vai_corinthians:
    while True:
        random_letter = random.choice(lowercase_letters + " " + "," + "!")
        time.sleep(0.01)
        print(f"{final_word}{random_letter}")
        if random_letter == letter:
            final_word += letter
            break