#!/usr/bin/env python3

import json
import os

new_key = os.getenv("LNPA_PATH")
if new_key[-1] == "/":
    raise "'LNPA_PATH' should not end with '/'!"

new_value = os.getenv("LNPA_DEST")
if new_value[-1] == "/":
    raise "'LNPA_DEST' should not end with '/'!"

file_path = "www/_d_/" + new_key[0] + ".json"

def append_to_json(filepath, key, value):
    try:
        # Step 1: Read the existing data
        with open(filepath, 'r') as file:
            data = json.load(file)

        # Step 2: Append the new key-value pair
        data[key] = value

        # Step 3: Write the updated data back to the file
        with open(filepath, 'w') as file:
            json.dump(data, file, indent=4)
        
        print(f"Successfully appended '{key}': '{value}' to {filepath}")
    except FileNotFoundError:
        print(f"Error: The file '{filepath}' was not found.")
    except json.JSONDecodeError:
        print(f"Error: Could not decode JSON from '{filepath}'.")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")

# Create a sample JSON file for the example if it doesn't exist
try:
    with open(file_path, 'x') as file:
        json.dump({new_key: new_value}, file, indent=4)
except FileExistsError:
    # Run the function
    append_to_json(file_path, new_key, new_value)