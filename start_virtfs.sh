#!/bin/sh
/home/fanzhipeng/work/qemu-4.0.0/aarch64-softmmu/qemu-system-aarch64 \
    -machine virt -cpu cortex-a57 \
    -m 2048 \
    -initrd rootfs.cpio \
    -kernel /home/fanzhipeng/work/linux-4.19.50/arch/arm64/boot/Image \
    -drive if=none,file=/home/fanzhipeng/work/ubuntu_rootf/fs.img,id=fs \
    -fsdev local,id=r,path=/home/fanzhipeng/work/test/,security_model=none \
    -device virtio-9p-device,fsdev=r,mount_tag=r \
    -append 'console=ttyAMA0 root=/dev/vda' \
    -nographic



