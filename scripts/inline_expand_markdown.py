#!/usr/bin/env python

"""
Expand inlined image written in markdown.

Inlined image is written like
```inline-pltcli
command arg to pltcli
```

This code block will converted into:
![command arg to pltcli](image_directory/image_${counter}.png)


Usage is:
  inline_expand_markdown.py from_markdown to_markdown image_directory
"""

import sys
import subprocess
import os
def convert(infile, out, image_dir):
    with open(infile) as fin:
        with open(out, "w") as fout:
            lines = fin.readlines()
            image_counter = 0
            inline_pltcli_counter = 0
            command = None
            for line in lines:
                if inline_pltcli_counter == 0:
                    if line.startswith("```inline-pltcli"):
                        inline_pltcli_counter = 1
                    else:
                        fout.write(line)
                elif inline_pltcli_counter == 1:
                    # line should include command to execute
                    output_filename = "%s/%s_image_%02d.png" % (image_dir, os.path.basename(infile).split(".")[0].replace("\[", "_").replace("\]", "_"),
                                                                image_counter)
                    print "save to", output_filename
                    command = line[:-1] # remove newline
                    print "Executing command", command
                    subprocess.check_call(["pltcli"] + command.split() + ["-o", output_filename])
                    inline_pltcli_counter = 2
                elif inline_pltcli_counter == 2:
                    # end of inline-pltcli
                    inline_pltcli_counter = 0
                    fout.write("![%s](%s)\n" % (command.replace("[", "_").replace("]", "_"),
                                                os.path.relpath(output_filename, os.path.dirname(out))))
                    image_counter = image_counter + 1
                    


if __name__ == "__main__":
    input_markdown = sys.argv[1]
    output_markdown = sys.argv[2]
    image_dir = sys.argv[3]
    convert(input_markdown, output_markdown, image_dir)
    
