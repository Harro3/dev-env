#!/bin/sh

set -e

./install-deps.sh

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

echo "Setting up docker perms"
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
sudo systemctl enable docker

echo "Setting up zsh as default shell"
chsh -s $(which zsh)

./stow-all.sh
