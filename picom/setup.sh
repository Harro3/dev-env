#!/bin/sh

cd picom
mkdir -p ~/.config/picom
stow -t ~/.config/picom dotfiles
