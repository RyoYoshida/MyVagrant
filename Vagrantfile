# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.box = "bento/centos-7.4"

    config.vm.network "forwarded_port", guest: 80, host: 8080
    config.vm.network "forwarded_port", guest: 3000, host: 3000
    config.vm.network "forwarded_port", guest: 3306, host: 3306
    config.vm.network "private_network", ip: "192.168.33.10"

    config.vm.provision "shell", path: "./provision.sh"
    config.vm.provision "shell", path: "./provision_ruby.sh"

    config.vm.synced_folder "./html", "/var/www/html", mount_options: ["dmode=777", "fmode=777"]
    config.vm.provision "shell", run: "always", inline: "mount -t vboxsf -o uid=`id -u apache`,gid=`id -g apache` var_www_html /var/www/html"
end
