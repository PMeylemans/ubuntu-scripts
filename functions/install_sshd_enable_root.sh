#! /bin/bash
#
# Filename : install_sshd_enable_root.sh
#
# Purpose  : install sshd deamon and enable root to user ssh access to the machine
#
# History :
# 2020-04-02  MEY Created.
# --------------------------------------------------------------------------------

is_installed=`apt list --installed | grep openssh-server |  wc -l`

if [ "$is_installed" -le "0" ]
 then
  clear
  echo -e "\n\n\n"
  echo "Installing sshd deamon..."
  apt install openssh-server -y
  systemctl enable ssh
  systemctl start ssh
 else
  clear
  echo -e "\n\n\n"
  echo "Allrady installed on this system..."
fi

# check if root acces to sshd is already OK on this system

 