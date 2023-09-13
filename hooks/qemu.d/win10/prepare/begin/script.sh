#!/bin/bash

hostCPUs=0-7,16-23
guestCPUs=8-15,24-31

UNDOFILE=/var/run/libvirt/qemu/w10-vfio-isolate-undo.bin

/usr/bin/vfio-isolate \
    -u $UNDOFILE \
    drop-caches \
    cpuset-modify --cpus C$hostCPUs /system.slice \
    cpuset-modify --cpus C$hostCPUs /user.slice \
    irq-affinity mask C$guestCPUs 

/usr/bin/taskset -pc $hostCPUs 2
cpupower frequency-set -g performance

