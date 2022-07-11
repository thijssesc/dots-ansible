#!/usr/bin/env sh

sudo pacman -S --needed --noconfirm python > /dev/nill
python -m ensurepip --upgrade
pip install ansible --upgrade

ansible-galaxy install -r requirements.yml
ansible-playbook main.yml -i ${1:-laptop}
