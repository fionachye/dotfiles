# Install sudo first
sudo pacman -Syu
sudo pacman -S sudo xorg-server lightdm lightdm-gtk-greeter openbox obconf pcmanfm tint2 nitrogen \
xterm termite gnome-terminal tmux vim gnome-backgrounds menumaker python python2 fuse2 nodejs npm \
base-devel ttf-dejavu ttf-liberation alsa-utils

# Install East Asian fonts
# Enable in /etc/locale.gen, then run locale-gen
sudo pacman -S adobe-source-han-sans-jp-fonts adobe-source-han-sans-cn-fonts \
adobe-source-han-sans-tw-fonts adobe-source-han-sans-kr-fonts

# Install notification
# Enable it by creating a file according to https://wiki.archlinux.org/index.php/Desktop_notifications#Notification_servers
sudo pacman -S notification-daemon

sudo systemctl enable lightdm.service

# Generate config and start sound service
# TODO: Install alsa-tray from AUR to enable volume icon
alsactl store
sudo systemctl enable alsa-restore.service
sudo systemctl start alsa-restore.service
