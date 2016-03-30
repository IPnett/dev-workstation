#!/bin/bash -eux

# Docs at https://docs.docker.com/engine/installation/linux/fedora/

sudo tee /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/fedora/$releasever/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF

sudo dnf install docker-engine
sudo systemctl enable docker
sudo systemctl start docker

echo "Try running

sudo docker run hello-world
"
