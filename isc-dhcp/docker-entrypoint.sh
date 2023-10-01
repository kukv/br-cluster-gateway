#!/bin/sh

set -e

ln -snf /usr/share/zoneinfo/JST /etc/localtime && echo "JST" > /etc/timezone

exec dhcpd \
  -d \
  -cf /etc/dhcp/dhcpd.conf \
  -lf /etc/dhcp/dhcpd.leases \
  -4 \
  --no-pid \
  -user dhcp \
  -group dhcp \
  eth0
