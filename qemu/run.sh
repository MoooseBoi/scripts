#!/bin/bash
# list existing vms in $HOME/VMs.
# choose vm
# run vm with data from config file.

[ "$1" == "" ] && exit 1

dir=$HOME/VMs/data/$1

while IFS='=' read -r key value; do
  [[ $key && $value ]] &&
  declare "$key=$value"
done < $dir/config

# do this later :P
[ "$ram" == "" ] && echo ""  # validate ram config
[ "$cpu" == "" ] && echo ""  # validate cpu config
[ "$system" == "" ] && echo ""  # validate system config
[ "$video" == "" ] && echo ""  # validate video config

qemu-system-x86_64 -enable-kvm -boot c -drive file=$dir/disk.qcow2 -cpu host -m $ram -vga virtio -display sdl,gl=on
