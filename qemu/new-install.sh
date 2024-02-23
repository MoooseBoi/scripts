#!/bin/bash
# input screen to select hardware options (add a bunch of defaults to make my life easier LOL)
# in $HOME/VMs folder, create new folder for this VM and create:
# - disk image
# - create config file with input options
# - create snapshot folder
#
# after finishing configuration, run vm with .iso first. 
# once installation complete, and vm closed, finish.

choose_name() {  
  read -p "Choose VM name: " name
  dir=$HOME/VMs/data/$name

  read

  [ -f $dir ] &&
    read -p "a VM with this name exists, would you like to delete it? [y,N]: " answer &&
    [ "$answer" == "y" ] && 
    rm -rf $dir  # haha funny rm -rf

  mkdir $dir
}

choose_disk() {
  # read -p "choose fs format: " fs
  # available=$(df -h | grep /dev/nvme0n1p7) &&
  read -p "Choose disk size: " disk_size &&
  qemu-img create -f qcow2 $dir/disk.qcow2 $disk_size
}

choose_ram() {  
  read -p "Choose RAM [default=2G]: " ram
  [ "$ram" == "" ] && ram="2G"
}

choose_iso() {
  iso_files=("", $(ls $HOME/VMs/iso))
  length=$((${#iso_files[@]}-1))

  for i in $(seq 1 $length); do
    echo "$i. ${iso_files[$i]}"
  done

  read -p "Choose .iso file [1-$length]: " iso_index
  iso="$HOME/VMs/iso/${iso_files[$iso_index]}"
}

load_config() {
  echo "ram=$ram" >> $dir/config
  # system type?
  # cpu options?
  # video options?
}


echo "Welcome to my stubborn ass ebay hypervisor!"
choose_name
choose_iso
choose_disk
choose_ram

load_config

cmd="qemu-system-x86_64 -enable-kvm -cdrom $iso -boot d -drive file=$dir/disk.qcow2 -m $ram -cpu host -vga virtio -display sdl,gl=on"
echo $cmd

exec $cmd

