#!/usr/bin/env sh

sudo pacman -S --needed --noconfirm python-pipx
pipx install ansible ansible-core

export PATH="$PATH:$HOME/.local/bin"

ansible-galaxy install -r requirements.yml
ansible-playbook main.yml -i "inventories/${1:-laptop}" \
 --tags system,pacman,aur,dots,dash,firefox,neovim,suckless,work
