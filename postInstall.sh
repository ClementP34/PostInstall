#!/bin/sh

#Script Lynis
apt-get update -y
apt-get dist-upgrade -y
apt-get install apt-listbugs apt-listchanges debian-goodies debsecan debsums

echo 0 > /proc/sys/net/ipv4/conf/all/accept_redirects
echo 1 > /proc/sys/net/ipv4/conf/all/log_martians
echo 0 > /proc/sys/net/ipv4/conf/all/send_redirects
echo 0 > /proc/sys/net/ipv4/conf/default/accept_redirects
echo 0 > /proc/sys/net/ipv4/conf/default/accept_source_route
echo 1 > /proc/sys/net/ipv4/conf/default/log_martians
echo 0 > /proc/sys/net/ipv4/tcp_timestamps
echo 0 > /proc/sys/net/ipv6/conf/all/accept_redirects
echo 0 > /proc/sys/net/ipv6/conf/default/accept_redirects

echo 1 > /proc/sys/kernel/core_uses_pid
echo 0 > /proc/sys/kernel/sysrq
