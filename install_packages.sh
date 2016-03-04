#!/bin/bash -eux

cat packages | xargs -n1 sudo dnf -y install

