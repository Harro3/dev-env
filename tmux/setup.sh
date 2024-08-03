#!/bin/sh

echo "Setting up tmux plugins manager"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

yay -S tmux

cd tmux
stow dotfiles -t ~
