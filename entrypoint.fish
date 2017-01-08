#!/usr/bin/fish

# Generate an SSH key at runtime
if not test -e /home/root/.ssh/id_rsa
  ssh-keygen -b 4096 -t rsa -N "" -f ~/.ssh/id_rsa >/dev/null 2>&1
end

if not test -L /home/root/.config/fish
  mkdir -p /home/root/code
  cd /home/root/code
  git clone https://github.com/iameli/home.git
  rm -rf /home/root/.config/fish
  ln -s /home/root/code/home/fish /home/root/.config/fish
end

set -Ux LC_ALL en_US.utf8
set -Ux my_emoji⭐️
set -Ux fish_greeting "Bwaaaaaaak!"

# The internet tells me this line tells me whether I'm interactive. Cool!
if isatty stdin
  # If we're interactive, get out of this crappy shell and run fish
  exec /usr/bin/fish
end

# Otherwise, we want to just sit around forever.
echo "Drumstick started noninteractively. Waiting forever."
tail -f /dev/null
