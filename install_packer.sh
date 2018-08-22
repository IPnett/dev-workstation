#!/bin/bash -eux

version="1.2.5"
filename="packer_${version}_linux_amd64.zip"
url="https://releases.hashicorp.com/packer/${version}/${filename}"

mkdir -p src
cd src
curl -O -L "$url"
sudo unzip -uo "${filename}" -d /usr/local/bin

