#!/bin/bash

choose_name() {  
  read -p "Choose VM name: " name
  dir=$HOME/VMs/data/$name

  [ "$(ls $HOME/VMs/data | grep $name)" != "" ] &&
    read -p "a VM with this name exists, would you like to delete it? [y,N]: " answer &&
    [ "$answer" == "y" ] && 
    rm -rf $dir  # haha funny rm -rf

  mkdir $dir
}

choose_disk() {
  read -p "Enter disk path: " disk_path

  if [ -f "$disk_path" ]; then
    mv $disk_path $dir/disk.qcow2
  else 
    echo "$disk_path does not exist."
    exit 1
  fi
}

choose_ram() {  
  read -p "Choose RAM [default=2G]: " ram
  [ "$ram" == "" ] && ram="2G"
}

load_config() {
  echo "ram=$ram" >> $dir/config
  # system type?
  # cpu options?
  # video options?
}

choose_name
choose_disk
choose_ram
load_config
