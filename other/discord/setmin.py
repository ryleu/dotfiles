#!/bin/env python3
import json
import sys

with open(sys.argv[1], "r") as file:
    try:
        c = json.loads(file.read())
    except json.decoder.JSONDecodeError as e:
        print("Generating new file")
        c = {}

if c.get("MIN_WIDTH", 1) != 0 or c.get("MIN_HEIGHT", 1) != 0:
    with open(sys.argv[1], "w") as file:
        c["MIN_WIDTH"] = 0
        c["MIN_HEIGHT"] = 0
        file.write(json.dumps(c, indent = 4, sort_keys = True) + "\n")
