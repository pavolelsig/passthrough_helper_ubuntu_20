Passthrough helper for Ubuntu 20.04 and 20.10<br/>

This script will bind any non-primary GPUs to the vfio-pci driver even if the secondary GPUs have the same id as the primary GPU<br/>

*This script is compatible with Ubuntu 20.04 and 20.10 and should also work with Linux Mint

For a tutorial visit: https://www.youtube.com/watch?v=ID3dlVHDl0c&t

Known issues: When generating new initramfs this script produces some IO errors. These are not displayed by default. <br/>
To view these, run "gpu_passthrough.sh -e".

Sources:<br/>
vfio-pci-override-vga.sh is a slightly modified version of the script found here:<br/>
http://vfio.blogspot.com/2015/05/
