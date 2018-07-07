#!/bin/sh

#Mise à jour
apt-get update -y
apt-get dist-upgrade -y

#Installation d'utilitaire permettant de surveiller les packets vulnerables
apt-get install apt-listbugs apt-listchanges debian-goodies debsecan debsums

#Installation des packet de base
apt-get install htop openssh-server -y

#Bloquage Reseau ip v4
echo 0 > /proc/sys/net/ipv4/conf/all/accept_redirects
echo 1 > /proc/sys/net/ipv4/conf/all/log_martians
echo 0 > /proc/sys/net/ipv4/conf/all/send_redirects
echo 0 > /proc/sys/net/ipv4/conf/default/accept_redirects
echo 0 > /proc/sys/net/ipv4/conf/default/accept_source_route
echo 1 > /proc/sys/net/ipv4/conf/default/log_martians
echo 0 > /proc/sys/net/ipv4/tcp_timestamps
#Bloquage Reseau ip v6
echo 0 > /proc/sys/net/ipv6/conf/all/accept_redirects
echo 0 > /proc/sys/net/ipv6/conf/default/accept_redirects
#Bloquage pour le kernel
echo 1 > /proc/sys/kernel/core_uses_pid
echo 0 > /proc/sys/kernel/sysrq
