#!/bin/bash

vms=($(ls $HOME/VMs/data))
length=$((${#vms[@]}-1))

for vm in ${vms[@]}; do
  echo $vm
done
