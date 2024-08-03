#!/bin/sh

yay -S tree zsh zoxide bat exa ripgrep

chsh -s $(which zsh)

cd zsh
stow dotfiles -t ~
