#!/usr/bin/fish
chsh -s /usr/bin/fish
mkdir /home/root

# Can't change root's home because we're root... so change /etc/passwd instead.
cat /etc/passwd | sed s/"root:\/root"/"root:\/home\/root"/ > /tmp/newpasswd
cat /tmp/newpasswd > /etc/passwd
rm /tmp/newpasswd

locale-gen en_US.UTF-8
