# -*- mode: ruby -*-
# vi; set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.box = "archlinux/archlinux"
    config.vm.synced_folder ".", "/home/vagrant/dots-ansible", disable: true
    config.vm.hostname = "archey"
    config.ssh.insert_key = false

    config.vm.provider :virtualbox do |v|
        v.memory = 4096
        v.linked_clone = true
    end

    config.vm.provision :shell, inline: <<-SHELL
        pacman -Syy --noconfirm
        pacman -Syu --noconfirm
        pacman -S --needed --noconfirm ansible
        yes | pacman -Sc
   SHELL
end