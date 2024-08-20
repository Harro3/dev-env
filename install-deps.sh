#!/bin/sh

packages=""

add() {
  packages+="$1 "
}

# General workflow tools

add gvim                  # Basic text editor
add discord               # Online messaging
add spotify               # Music player
add firefox               # Web browser
add neovim                # Text editor
add stow                  # Dotfiles management
add kitty                 # Terminal emulator
add yazi                  # Terminal based file explorer
add lazygit               # Git TUI
add tree                  # Display files as tree
add zsh                   # Z shell
add tmux                  # Terminal multiplexer

# System tools

add acpi                  # kernel module
add scrot                 # screenshot utility
add sysstat               # Monitoring tools
add tumbler               # Thumbnail service
add unzip                 # Zip archive manager
add zip
add xarchiver             # Archiver for X
add xbindkeys             # Key binding utility for X
add mpv                   # Media player
add network-manager-applet # Networks Manager
add numlockx
add jq                    # CLI json processor
add arandr                # monitor manager UI
add awesome-terminal-fonts # Fonts
add dex                   # Desktop entry files generator
add lightdm               # Display manager
add lightdm-slick-greeter # Slick looking greeter for lightdm
add interception-tools    # Used to intercept interrupts
add interception-caps2esc # Binds capslock to escape
add ttf-fira-code         # Code font 
add ttf-nerd-fonts-symbols # Icons and symbols
add zathura               # File viewer
add zathura-pdf-poppler   # Pdf plugin for zathura
add xclip

# Development tools
add rust                  # Rust programming language
add python                # python programming language
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
add i3blocks
add i3lock
add i3status
add rofi                  # App selection menu
add dunst                 # Notification manager
add feh                   # Image manager
add galculator            # Calculator app
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

# Misc

add polkit-gnome
add xorg-xbacklight
add xorg-xdpyinfo
add networkmanager
add networkmanager-openconnect
add networkmanager-openvpn
add noto-fonts
add noto-fonts-emoji
add pipewire-alsa
add pipewire-jack

yay -S $packages

# Misc installations
sudo npm install -g tree-sitter-cli   # Used for tree-sitter latex parser
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm # Tmux plugin manager

