#!/bin/bash

#Making sure this script runs with elevated privileges
if [ $EUID -ne 0 ]
	then
		echo "Please run this as root!" 
		exit 1
fi

if [ -a grub_backup.txt ]
	then 
	mv grub_backup.txt /etc/default/grub
fi

update-grub

rm /etc/initramfs-tools/scripts/init-top/vfio-pci-override-vga.sh

update-initramfs -u
