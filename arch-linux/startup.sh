# Install sudo first
sudo pacman -Syu
sudo pacman -S sudo xorg-server lightdm lightdm-gtk-greeter openbox obconf pcmanfm tint2 nitrogen \
xterm termite gnome-terminal tmux vim gnome-backgrounds menumaker python python2 fuse2 nodejs npm \
base-devel ttf-dejavu ttf-liberation alsa-utils

sudo systemctl enable lightdm.service

# Generate config and start sound service
alsactl store
sudo systemctl enable alsa-restore.service
sudo systemctl start alsa-restore.service
