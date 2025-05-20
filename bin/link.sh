#!/bin/bash

dots=~/dotfiles
config=~/.config

if [ ! -d $dots ]; then
  echo "the directory $dots doesn't exists"
  exit 1
fi

mkdir -p ~/.local/bin
ln -sf $dots/bin ~/.local/bin

ln -sf $dots/alacritty $config/alacritty 
ln -sf $dots/bash/.bashrc ~/.bashrc
ln -sf $dots/btop $config/btop
ln -sf $dots/ghostty $config/ghostty
ln -sf $dots/htop $config/htop
ln -sf $dots/i3 $config/i3
ln -sf $dots/neofetch $config/neofetch
ln -sf $dots/nvim $config/nvim
ln -sf $dots/picom $config/picom
ln -sf $dots/sway $config/sway
ln -sf $dots/tmux $config/tmux
ln -sf $dots/waybar $config/waybar
ln -sf $dots/wofi $config/wofi
ln -sf $dots/zsh/.zshrc ~/.zshrc
