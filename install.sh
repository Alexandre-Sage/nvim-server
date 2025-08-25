#!/bin/env sh
#UBUNTU
apt-get install nodejs npm cmake gcc fd-find fzf ripgrep curl -y

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz

tar -C /opt -xzf nvim-linux-x86_64.tar.gz

echo 'export PATH="$PATH:/opt/nvim-linux-x86_64/bin"' >> ~/.bashrc

ln -s /opt/nvim-linux-x86_64/bin/nvim /bin/nvim
