#!/bin/bash

ip -4 addr flush dev eth0
ip -4 addr add 192.168.87.10/24 dev eth0
ip -4 route del default
ip -4 route add default via 192.168.87.254 dev eth0

exec "$@"


