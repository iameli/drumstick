#!/bin/bash

# Generate an SSH key at runtime
ssh-keygen -b 4096 -t rsa -N "" -f ~/.ssh/id_rsa

# The internet tells me this line tells me whether I'm interactive. Cool!
if [ -t 1 ]
then
  # If we're interactive, get out of this crappy shell and run fish
  exec /usr/bin/fish
else
  # Otherwise, we want to just sit around forever.
  echo "Drumstick started noninteractively. Waiting forever."
  tail -f /dev/null
fi
