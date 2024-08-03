#!/bin/sh

yay -S picom flameshot

cd i3
stow -t ~/.config/i3 dotfiles
