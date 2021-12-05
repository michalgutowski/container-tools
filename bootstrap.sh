#!/bin/sh

# Disable SELinux
sudo setenforce 0
sudo sed -i '/^SELINUX=.*/s//SELINUX=disabled/' /etc/selinux/config

# Set up hosts file
sudo sed -i 1d /etc/hosts 
printf '192.168.99.100 podman\n' | sudo tee -a /etc/hosts > /dev/null

# Upgrading Oracle Linux box with latest packages
sudo dnf -y update

# Installing EPEL repo
sudo dnf -y install oracle-epel-release-el8

# Installing container tools
sudo dnf -y install podman podman-docker podman-remote podman-compose skopeo buildah runc git jq net-tools bind-utils unzip

# Enabling the Podman API using systemd in rootless mode
systemctl --user enable --now podman.socket

# Add public key to authorized keys for vagrant user
cat /vagrant/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys

# Uncomment if you want to remove Oracle Container Services from registries list
# sudo sed -i s/\'container\-registry\.oracle\.com\'\,\ //g /etc/containers/registries.conf
