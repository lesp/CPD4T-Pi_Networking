#!/bin/bash
interface=eth0
echo bringing up $interface
sudo ifconfig $interface 192.168.2.1
echo NAT
sudo /sbin/iptables --table nat -A POSTROUTING -o wlan0 -j MASQUERADE
sudo sh -c 'echo 1 > /proc/sys/net/ipv4/ip_forward'
echo dchp server in background
sudo udhcpd udhcpd.conf -S
