#!/usr/bin/env bash

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
curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install npm packages
npm install -g neovim
npm install -g bash-language-server

cd ~/

echo "### Message to ME ###"
echo "Ensure python or python3 is in your \$PATH."
echo "Then run \`python3 -m pip install --user --upgrade pynvim\`"
echo "Done. Remember to cd into dotfiles/ and copy vim configs"
