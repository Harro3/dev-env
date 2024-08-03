#!/bin/sh

yay -S neovim docker docker-compose npm openjdk-17 ripgrep

cd nvim
mkdir -p ~/.config/nvim
stow dotfiles -t ~/.config/nvim
