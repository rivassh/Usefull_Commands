#!/bin/bash
mount /dev/nvme0n1p2 /mnt
mount -t proc none /mnt/proc
mount -t proc none /mnt/proc
mount -o bind /dev /mnt/dev
mount -o bind /dev /mnt/dev
mount --rbind /sys /mnt/sys
mount -t efivarfs none /mnt/sys/firmware/efi/efivars
chroot /mnt/ /bin/bash
#mount -a
#mount -t efivarfs none /sys/firmware/efi/efivars


