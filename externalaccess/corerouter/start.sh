#!/bin/bash

gw=$(ip r show default | awk '{print $3}')

waniface=$(ip r show default | awk '{print $5}')
laniface=eth1

if [ "$waniface" == "eth1" ]
then
    laniface=eth0
fi

ip -4 addr flush dev $laniface
ip -4 addr add 192.168.87.254/24 dev $laniface

wanip=$(ip a show $waniface | grep 'inet ' | awk '{print $2}' | awk -F/ '{print $1}')

ip link add gretest type gre remote 0.0.0.0 local $wanip # 0.0.0.0 for allow any src ip
ip link set gretest up
ip link add ipiptest type ipip remote 0.0.0.0 local $wanip # 0.0.0.0 for allow any src ip
ip link set ipiptest up

iptables -t nat -A POSTROUTING -o $waniface -j MASQUERADE

sleep infinity

