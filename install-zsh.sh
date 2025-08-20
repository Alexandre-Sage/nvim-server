#!/bin/env sh

SCRIPT_ABSOLUTE_DIR_PATH=$(pwd)
ZSH_PLUGINS_DIR=/usr/share/zsh/plugins

#UBUNTU
apt-get install zsh

mkdir /usr/share/zsh/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git  $ZSH_PLUGINS_DIR/zsh-autosuggestions 
git clone https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_PLUGINS_DIR/zsh-autocomplete
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_PLUGINS_DIR/zsh-syntax-highlighting
git clone https://github.com/jeffreytse/zsh-vi-mode $ZSH_PLUGINS_DIR/zsh-vi-mode

ln -s "$SCRIPT_ABSOLUTE_DIR_PATH/.zshrc" "$HOME/.zshrc"
ln -s "$SCRIPT_ABSOLUTE_DIR_PATH/.fzfrc" "$HOME/.fzfrc"
