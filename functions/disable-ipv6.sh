#! /bin/bash
#
# Filename : disable-ipv6.sh
#
# Purpose  : To disable feed-back to the Ubuntu comunity about installed packages
#
# History :
# 2020-03-31  MEY Created.
# --------------------------------------------------------------------------------

# Get the colation of this script, used files are relative to this location
directory="$(dirname "$0")"

found_disable=`grep ipv6.disable /etc/default/grub`

if [ $found_disable .ge 1 ]
 then
	clear
	echo -e "\n\n\n"
	echo "ipv6 allready disabled on this system"
 else
    clear
	echo "GRUB_CMDLINE_LINUX_DEFAULT=\"ipv6.disable=1\" >> /etc/default/grub"
	echo "GRUB_CMDLINE_LINUX=\"ipv6.disable=1\" >> /etc/default/grub"
	update-grub
	echo -e "\n\n\n"
	echo "ipv6 disabled, system needs to be rebooted"
fi


