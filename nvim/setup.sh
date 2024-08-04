#!/bin/sh

yay -S neovim docker docker-compose npm jre17-openjdk ripgrep python-black clang prettier stylua python-isort xsel ltex-ls-bin texlab markdownlint marksman zathura texlive texlive-langfrench pandoc latex-mk zathura-pdf-poppler lazygit

sudo npm install -g tree-sitter-cli

cd nvim
mkdir -p ~/.config/nvim
stow dotfiles -t ~/.config/nvim
