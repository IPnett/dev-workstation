#/bin/bash -eux

version="1.8.1"
url="https://releases.hashicorp.com/vagrant/${version}/vagrant_${version}_x86_64.rpm"
sudo dnf install -y "$url"

# libvirt plugin requirements
sudo dnf -y install libxslt-devel libxml2-devel libvirt-devel
echo "vagrant plugins are typically installed per user ..."
vagrant plugin install vagrant-libvirt

