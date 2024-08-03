#!/bin/sh

yay -S neovim docker docker-compose npm jre17-openjdk ripgrep python-black clang prettier stylua python-isort xsel ltex-ls-bin texlab markdownlint marksman

cd nvim
mkdir -p ~/.config/nvim
stow dotfiles -t ~/.config/nvim
