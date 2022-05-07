#!/bin/env python3
import json
import sys

with open(sys.argv[1], "r") as file:
    c = json.loads(file.read())

with open(sys.argv[1], "w") as file:
    if c.get("MIN_WIDTH", 1) != 0 or c.get("MIN_HEIGHT", 1) != 0:
        c["MIN_WIDTH"] = 0
        c["MIN_HEIGHT"] = 0
        file.write(json.dumps(c) + "\n")
    
