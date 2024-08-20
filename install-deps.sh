#!/bin/sh

packages=""

add() {
  packages+="$1 "
}

# General workflow tools

add gvim                  # Basic text editor
add discord               # Online messaging
add spotify               # Music player
add neovim                # Text editor
add stow                  # Dotfiles management
add kitty                 # Terminal emulator
add yazi                  # Terminal based file explorer
add lazygit               # Git TUI
add tree                  # Display files as tree
add zsh                   # Z shell
add tmux                  # Terminal multiplexer

# System tools

add lightdm               # Display manager
add lightdm-slick-greeter # Slick looking greeter for lightdm
add interception-tools    # Used to intercept interrupts
add interception-caps2esc # Binds capslock to escape
add ttf-fira-code         # Code font 
add ttf-nerd-fonts-symbols # Icons and symbols
add zathura               # File viewer
add zathura-pdf-poppler   # Pdf plugin for zathura

# Development tools
add docker                # Container management
add docker-compose        # docker comtainer orchestrator
add npm                   # Node package manager
add jre17-openjdk         # Java development kit 17
add clang                 # C language
add texlab                # Latex compiler
add texlive               # Live latex compiler
add texlive-langfrench    # French language support for texlive
add pandoc                # Document conversion tool
add latex-mk              # Yet another latex compiler

# I3 tools

add i3-wm                 # Window manager
add picom                 # Window compositor
add flameshot             # Screenshot tool
add autotiling            # Automatic tiling script for i3
add autorandr             # Screen layouts manager
add brightnessctl         # brightness control

# Zsh tools

add zoxide                # Easy directory navigation
add fzf                   # Fuzzy finder for files
add bat                   # Better cat
add exa                   # Better ls

# Neovim tools
add ripgrep               # Enhanced grep used by telescope
add python-black          # Python code linter
add prettier              # JavaScript code linter
add stylua                # Lua code formatter
add python-isort          # Code formatter
add xsel                  # System clipboard support
add ltex-ls-bin           # Latex language server
add markdownlint          # Markdown linter
add marksman              # Markdown formatter

yay -S $packages

# Misc installations
sudo npm install -g tree-sitter-cli   # Used for tree-sitter latex parser
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm # Tmux plugin manager

