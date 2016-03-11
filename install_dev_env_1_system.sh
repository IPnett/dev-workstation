#!/bin/bash -eux

do_install() {
  cdir=$PWD
  mkdir -p src
  cd src
  curl -L -o "${filename}" "$url"

  tar xvfz "${filename}"
  cd "${filename%.tar.gz}"
  sudo make install
  cd $PWD
}

# ruby-install
version="0.6.0"
filename="ruby-install-${version}.tar.gz"
url="https://github.com/postmodern/ruby-install/archive/v${version}.tar.gz"

do_install

# chruby
version="0.3.9"
filename="chruby-${version}.tar.gz"
url="https://github.com/postmodern/chruby/archive/v${version}.tar.gz"

do_install

# make sure we got the ruby build deps installed
sudo dnf install -y gcc automake zlib-devel libyaml-devel openssl-devel gdbm-devel readline-devel ncurses-devel libffi-d
evel || true

