#!/usr/bin/fish
chsh -s /usr/bin/fish

mkdir -p /root/code
fish -c 'cd /root/code; git clone https://github.com/iameli/home.git'
rm -rf /root/.config/fish
ln -s /root/code/home/fish /root/.config/fish

locale-gen en_US.UTF-8
