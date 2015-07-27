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

RUN proot -0 -b /etc/resolv.conf -r /opt/rootfs -q qemu-arm-static /bin/bash -c \
  'apt-get update && \
  apt-get install -y --force-yes curl libssl-dev python build-essential && \
  apt-get clean'

RUN proot -0 -b /etc/resolv.conf -r /opt/rootfs -q qemu-arm-static /bin/bash -c \
  'curl -o- https://raw.githubusercontent.com/pypa/pip/master/contrib/get-pip.py | python'

RUN proot -0 -b /etc/resolv.conf -r /opt/rootfs -q qemu-arm-static /bin/bash -c \
  'pip install awscli'
