sudo pacman -Syu

sudo pacman -S \
    sudo \
    `# Documentation` \
    man-db \
    man-pages \
    texinfo \
    `# GUI and inputs` \
    xorg-server \
    xorg-xinput  `# For querying and setting mouse sensitivities` \
                 `# See https://wiki.archlinux.org/index.php/Mouse_acceleration#Disabling_mouse_acceleration` \
    xorg-xrandr  `# Monitor config CLI` \
    arandr  `# GUI version for xrandr`  \
    xorg-xset \
    lightdm \
    lightdm-gtk-greeter \
    `# Window Manager and Desktop Display` \
    gnome-backgrounds \
    menumaker \
    openbox \
    obconf \
    tint2 \
    nitrogen \
    gnome-screenshot \
    `# Terminals` \
    xterm \
    termite \
    gnome-terminal \
    `# Coding` \
    tmux \
    vim \
    python \
    python2 \
    tree \
    `# For compiling Neovim and autocompletion` \
    fuse2 \
    nodejs \
    npm \
    base-devel `# Required for building AUR packages` \
    `# Fonts` \
    ttf-dejavu \
    ttf-liberation \
    `# East Asian Fonts` \
    `# Enable in /etc/locale.gen, then run locale-gen` \
    adobe-source-han-sans-jp-fonts \
    adobe-source-han-sans-cn-fonts \
    adobe-source-han-sans-tw-fonts \
    adobe-source-han-sans-kr-fonts \
    `# Audio` \
    alsa-utils  `# Audio control interface` \
    pulseaudio `# Make audio also work with OBS Studio` \
    pavucontrol  `# Audio control GUI` \
    `# File Manager` \
    thunar \
    pcmanfm \
    `# Notifications` \
    `# Enable it by creating a file according to https://wiki.archlinux.org/index.php/Desktop_notifications#Notification_servers` \
    notification-daemon \
    `# Package Manager` \
    flatpak \
    `# Nvidia drivers (Uncomment multilib in /etc/pacman.conf)` \
    lib32-nvidia-utils \
    nvidia-utils \
    `# Enable multiple monitors` \
    nvidia-settings \
    `# Nvida drivers` \
    nvidia \
    `# Games and Media` \
    lutris \
    obs-studio \


# Avoid blank screen after restart
sudo systemctl enable lightdm.service

# Generate config and start sound service
# TODO: Install alsa-tray from AUR to enable volume icon
alsactl store
sudo systemctl enable alsa-restore.service
sudo systemctl start alsa-restore.service
