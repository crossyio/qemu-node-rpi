#      __//
#     /.__.\
#     \ \/ /
#  '__/    \
#   \-      )
#    \_____/
# _____|_|____
#      " "
#   crossy.io

FROM kinsamanka/docker-qemu-chroot:rpi-base

MAINTAINER Crossy.IO <docker@crossy.io>

RUN sh -c 'cp /etc/resolv.conf /opt/rootfs/etc/resolv.conf' && \
proot -r /opt/rootfs -q qemu-arm-static /bin/bash -c 'apt-get update && \
apt-get install -y --force-yes curl libssl-dev python build-essential && \
apt-get clean'
