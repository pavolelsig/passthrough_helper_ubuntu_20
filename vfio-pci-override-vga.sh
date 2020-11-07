#!/bin/sh

for i in /sys/bus/pci/devices/*/boot_vga; do
    if [ $(cat "$i") -eq 0 ]; then
        GPU="${i%/boot_vga}"
        AUDIO="$(echo "$GPU" | sed -e "s/0$/1/")"
        echo "vfio-pci" > "$GPU/driver_override"
	BIND_GPU=`echo "$GPU" | cut -d '/' -f 6`
	echo "$BIND_GPU" >> /sys/bus/pci/drivers/vfio-pci/bind
        if [ -d "$AUDIO" ]; then
        echo "vfio-pci" > "$AUDIO/driver_override"
	BIND_AUDIO=`echo "$AUDIO" | cut -d '/' -f 6`
	echo "$BIND_AUDIO" >> /sys/bus/pci/drivers/vfio-pci/bind
        fi
    fi
done

