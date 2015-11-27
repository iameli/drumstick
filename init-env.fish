#!/usr/bin/fish
chsh -s /usr/bin/fish
mkdir /home/root
usermod -m -d /home/root root

locale-gen en_US.UTF-8
