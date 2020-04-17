#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install -y curl gcc g++ make build-essential python-pip python3-pip python-setuptools python3-setuptools

# Install latest stable nvim
mkdir -p /tmp/_my_workbench_
cd /tmp/_my_workbench_
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage nvim
sudo mv nvim /usr/local/bin/

cd ~/

# Install nodejs and npm
# Update according to this page: https://github.com/nodesource/distributions#debinstall
# Install latest nodejs
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install npm packages
sudo npm install -g neovim
sudo npm install -g bash-language-server

sudo apt-get -y autoremove && sudo apt-get -y autoclean

cd ~/
python2 -m pip install --user --upgrade pip
python2 -m pip install --user --upgrade pynvim
python3 -m pip install --user --upgrade pip
python3 -m pip install --user --upgrade pynvim

echo "### Message to ME ###"
echo "Ensure python or python3 is in your \$PATH."
echo "Remember to cd into dotfiles/ and copy vim configs"
