#!/usr/bin/fish
chsh -s /usr/bin/fish

mkdir code
cd code
git clone https://github.com/iameli/home.git home
mkdir -p ~/.config
rm -rf ~/.config/fish
ln -s ~/code/home/fish ~/.config/fish
locale-gen en_US.UTF-8
echo $my_emoji
