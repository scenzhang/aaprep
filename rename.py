import os

for filename in os.listdir("."):
    if filename.startswith("appacademy-online"):
        tokens = filename.split("-")
        new_name = '-'.join(tokens[2:-1])
        os.rename(filename, new_name)
