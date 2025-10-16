#!/bin/bash

ip -4 addr flush dev eth0
ip -4 addr add 192.168.87.11/24 dev eth0
ip -4 route del default
ip -4 route add default via 192.168.87.254 dev eth0

ip link add gretest type gre remote 0.0.0.0 local 192.168.87.11
ip link set gretest up
ip link add ipiptest type ipip remote 0.0.0.0 local 192.168.87.11
ip link set ipiptest up

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

sleep infinity

