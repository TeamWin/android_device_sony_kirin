#!/sbin/sh

suffix=$(getprop ro.boot.slot_suffix)
if [ -z "$suffix" ]; then
    suf=$(getprop ro.boot.slot)
    suffix="_$suf"
fi

vendorpath="/dev/block/bootdevice/by-name/vendor$suffix"
mount -t ext4 -o ro "$vendorpath" /vendor
insmod /vendor/lib/modules/nt36xxx_driver.ko
umount /vendor
