# -*- mode: ruby -*-
# vi: set ft=ruby :

unless File.exists?("id_rsa")
 system("ssh-keygen -t rsa -f id_rsa -N '' -q")
end 

Vagrant.configure("2") do |config|
  config.vm.base_mac = nil
  config.vm.box = "oraclelinux/8"
  config.vm.box_url = "https://oracle.github.io/vagrant-projects/boxes/oraclelinux/8.json"

  config.vm.define "podman" do |podman|
    podman.vm.provider "virtualbox" do |vb|
      vb.memory = 4 * 1024
      vb.cpus = 2
      vb.name = "podman"
    end
    
    podman.vm.hostname = "podman"
    podman.vm.network "private_network", ip: "192.168.99.100"
    podman.vm.provision :shell, privileged: false, path: "bootstrap.sh"
  end
end
