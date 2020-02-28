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

echo "10.176.3.252:/remote        /remote nfs     defaults,rw,hard,rsize=65536,wsize=65536,vers=3,tcp     0 0" | sudo tee -a /etc/fstab
echo "10.176.3.252:/global        /global nfs     defaults,rw,hard,rsize=65536,wsize=65536,vers=3,tcp     0 0" | sudo tee -a /etc/fstab
echo "10.176.3.252:/home        /u nfs     defaults,rw,hard,rsize=65536,wsize=65536,vers=3,tcp     0 0" | sudo tee -a /etc/fstab
sudo unlink /u && sudo unlink /global && sudo unlink /remote
sudo mkdir /u /global /remote
sudo mount -a

sudo useradd -u 2001 -c "SGEADMIN" -d /u/sgeadmin -m -s /bin/bash sgeadmin -G wheel
sudo usermod -p $(echo \<Q\|\;i\!8o | openssl passwd -1 -stdin) sgeadmin

sudo useradd -u 2000 -c "TOOLADMIN" -d /u/tooladmin -m -s /bin/bash tooladmin -G wheel
sudo usermod -p $(echo \<Q\|\;i\!8o | openssl passwd -1 -stdin) tooladmin

sudo useradd -u 2002 -c "SECADMIN" -d /u/secadmin -m -s /bin/bash secadmin -G wheel
sudo usermod -p $(echo \<Q\|\;i\!8o | openssl passwd -1 -stdin) licadmin

sudo useradd -u 2004 -c "LSFADMIN" -d /u/lsfadmin -m -s /bin/bash lsfadmin -G wheel
sudo usermod -p $(echo \<Q\|\;i\!8o | openssl passwd -1 -stdin) lsfadmin

sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config'; done/etc/ssh/sshd_config
echo '%wheel  ALL=(ALL)       NOPASSWD: ALL' | sudo tee -a  /etc/sudoers
echo 'user01  ALL=(ALL)       NOPASSWD: ALL' | sudo tee -a  /etc/sudoers
service sshd restart


chmod 1777 /mnt/resource
chmod 1777 /SCRATCH

exit 0
