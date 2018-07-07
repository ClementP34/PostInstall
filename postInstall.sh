#!/bin/sh

post_install(){

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
}
 
post_uninstall(){
apt-get remove apt-listbugs apt-listchanges debian-goodies debsecan debsums
apt-get remove htop openssh-server -y
echo 1 > /proc/sys/net/ipv4/conf/all/accept_redirects
echo 0 > /proc/sys/net/ipv4/conf/all/log_martians
echo 1 > /proc/sys/net/ipv4/conf/all/send_redirects
echo 1 > /proc/sys/net/ipv4/conf/default/accept_redirects
echo 1 > /proc/sys/net/ipv4/conf/default/accept_source_route
echo 0 > /proc/sys/net/ipv4/conf/default/log_martians
echo 1 > /proc/sys/net/ipv4/tcp_timestamps
echo 1 > /proc/sys/net/ipv6/conf/all/accept_redirects
echo 1 > /proc/sys/net/ipv6/conf/default/accept_redirects
echo 0 > /proc/sys/kernel/core_uses_pid
echo 176 > /proc/sys/kernel/sysrq     
}

case "$1" in
        install)
                echo -n "Install"
                post_install
                echo "Fin d'installation"
                ;;
        uninstall)
                echo -n "Uninstall"
                post_uninstall
                echo "Fin de deinstall"
                ;;
        "")
                echo -n "Install"
                post_install
                echo "Fin d'installation"
                ;;
        *)
                echo "Post-Installation"
                echo "Usage: $0 {install uninstall}"
                exit 1
                ;;
esac
 
exit 0 
