# Install sudo first
sudo pacman -Syu
sudo pacman -S sudo xorg-server lightdm lightdm-gtk-greeter openbox obconf pcmanfm tint2 nitrogen xterm termite gnome-terminal tmux vim gnome-backgrounds menumaker python python2

sudo systemctl enable lightdm.service
