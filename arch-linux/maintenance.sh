sudo pacman -Rsn $(sudo pacman -Qtdq)
sudo rm  /var/cache/pacman/pkg/*pkg*
sudo rm -rf ~/.cache/* ~/.local/share/*

