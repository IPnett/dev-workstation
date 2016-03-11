#!/bin/bash -eux

cat packages | grep -v ^\# | xargs -n1 sudo dnf -y install

