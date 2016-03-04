#!/bin/bash -eux

version="2.2.3"
filename="hub-linux-amd64-${version}.tgz"
url="https://github.com/github/hub/releases/download/v${version}/${filename}"

mkdir -p src
cd src
curl -O -L "$url"

tar xfv "${filename}"
cd "${filename%.tgz}"
sudo ./install

