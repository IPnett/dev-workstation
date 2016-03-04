#!/bin/bash -ux

networks=$(sudo virsh net-list --name | grep -E '^(projectname.*|vagrant-libvirt)$')
echo $networks | xargs -rn1 sudo virsh net-destroy
echo $networks | xargs -rn1 sudo virsh net-undefine

