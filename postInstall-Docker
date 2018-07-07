#!/bin/sh

post_install(){

#Mise à jour
apt-get update -y
apt-get dist-upgrade -y

#Installation d'utilitaire permettant de surveiller les packets vulnerables
apt-get install apt-listbugs -y 
apt-get install apt-listchanges -y 
apt-get install debian-goodies -y
apt-get install debsecan -y
apt-get install debsums -y

#Installation des packet de base
#apt-get install htop openssh-server -y

#Bloquage Reseau ip v4
echo 1 > /proc/sys/kernel/core_uses_pid
echo 2 > /proc/sys/kernel/kptr_restrict
echo 0 > /proc/sys/kernel/sysrq
echo 0 > /proc/sys/net/ipv4/conf/all/forwarding
echo 1 > /proc/sys/net/ipv4/conf/all/log_martians
echo 1 > /proc/sys/net/ipv4/conf/default/log_martians
echo 0 > /proc/sys/net/ipv4/conf/all/send_redirects
#
echo 0 > /proc/sys/net/ipv4/conf/default/accept_redirects
echo 0 > /proc/sys/net/ipv4/conf/default/accept_source_route
echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
echo 0 > /proc/sys/net/ipv4/tcp_timestamps
echo 0 > /proc/sys/net/ipv6/conf/all/accept_redirects
echo 0 > /proc/sys/net/ipv6/conf/default/accept_redirects

}
 
post_uninstall(){
#apt-get remove apt-listbugs apt-listchanges debian-goodies debsecan debsums
#apt-get remove htop openssh-server -y
echo 0 > /proc/sys/kernel/core_uses_pid
echo 0 > /proc/sys/kernel/kptr_restrict
echo 1 > /proc/sys/net/ipv4/conf/all/forwarding
echo 0 > /proc/sys/net/ipv4/conf/all/log_martians
echo 0 > /proc/sys/net/ipv4/conf/default/log_martians
echo 1 > /proc/sys/net/ipv4/conf/all/send_redirects
echo 1 > /proc/sys/net/ipv4/conf/default/accept_redirects
echo 1 > /proc/sys/net/ipv4/conf/default/accept_source_route
echo 0 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
echo 1 > /proc/sys/net/ipv4/tcp_timestamps
echo 1 > /proc/sys/net/ipv6/conf/all/accept_redirects
echo 1 > /proc/sys/net/ipv6/conf/default/accept_redirects
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
