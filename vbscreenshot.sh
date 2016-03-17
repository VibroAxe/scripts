#!/bin/bash
#PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

vboxmanage=/usr/bin/VBoxManage

# Specify the output directory
outputdir=~/

# Find the next free image ID (1.png, 2.png, 3.png, etc.)
cd $outputdir
list=([0-9]*)
last=${list[@]: -1}
nextnum=$((10#${last%%[^0-9]*} + 1))

# Find out the name of the running VM; this assumes that you have just one VM running at a time
for uuid in $($vboxmanage list runningvms --long | grep "UUID:            " | awk 'BEGIN{FS="UUID:            "}{print $2}')
do
  vm=$($vboxmanage showvminfo $uuid      | sed -e'/^USB Device Filters:/,$ d' | grep "Name:"  | awk 'BEGIN{FS="Name:            "}{print $2}')
done

# Alternatively, you can specify the name of the VM here of which you want to take a screenshot
#vm="Ubuntu 12.04 Desktop"

$vboxmanage controlvm "$vm" screenshotpng $outputdir/$nextnum.png
exit 0
