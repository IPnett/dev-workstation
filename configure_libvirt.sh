#!/bin/bash -eux

sudo systemctl enable libvirtd
sudo systemctl start libvirtd

# allow users in group wheel to manage VMs locally
echo '
polkit.addRule(function(action, subject) {
  if ((action.id == "org.libvirt.unix.manage"
    || action.id == "org.libvirt.unix.monitor")
    && subject.isInGroup("wheel")) {
    return polkit.Result.YES;
  }
});
' | sudo tee /etc/polkit-1/rules.d/10.libvirt.rules
sudo systemctl restart libvirtd

# enable nested kvm support
echo "options kvm_intel nested=1" | sudo tee /etc/modprobe.d/kvm.conf

