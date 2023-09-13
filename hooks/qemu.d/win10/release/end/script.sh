#!/bin/bash

UNDOFILE=/var/run/libvirt/qemu/w10-vfio-isolate-undo.bin

/usr/bin/vfio-isolate \
	restore $UNDOFILE

/usr/bin/taskset -pc 0-31 2
