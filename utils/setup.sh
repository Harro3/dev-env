#!/bin/sh

yay -S gvim discord spotify nvim interception-tools interception-caps2esc stow kitty ttf-fira-code ttf-nerd-fonts-symbols yazi

echo "Setting up udevmon for escape / capslock binding"

sudo mkdir -p /etc/interception/
sudo touch /etc/interception/udevmon.yaml
echo '
- JOB: intercept -g $DEVNODE | caps2esc -m 1 | uinput -d $DEVNODE
  DEVICE:
    EVENTS:
      EV_KEY: [KEY_CAPSLOCK, KEY_ESC]
' | sudo tee -a /etc/interception/udevmon.yaml > /dev/null

sudo systemctl enable udevmon
sudo systemctl start udevmon

cd utils

stow dotfiles -t ~
mkdir -p ~/.local/bin
stow bin -t ~/.local/bin
