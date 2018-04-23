#! /bin/bash

sudo yum -y install open-vm-tools
mkdir /mnt/win/
sudo vmhgfs-fuse .host:/ /mnt/win -o subtype=vmhgfs-fuse,allow_other

exit;

