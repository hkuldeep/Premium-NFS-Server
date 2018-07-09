#!/bin/bash

#install_pkgs()
#{
#    yum -y install epel-release
#}


#systemctl stop firewalld
#systemctl disable firewalld

# Disable SELinux
#sed -i 's/SELINUX=.*/SELINUX=disabled/g' /etc/selinux/config
#setenforce 0

#install_pkgs

chmod 1777 /mnt/resource
chmod 1777 /SCRATCH

exit 0
