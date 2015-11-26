#!/usr/bin/env python

import sys
import csv

from_file = sys.argv[1]
to_file = sys.argv[2]
scale = float(sys.argv[3])

with open(from_file, "r") as f:
    with open(to_file, "w") as of:
        reader = csv.reader(f)
        writer = csv.writer(of)
        writer.writerow(reader.next())
        for row in reader:
            writer.writerow([row[0]] + [float(r) * scale for r in row[1:]])
