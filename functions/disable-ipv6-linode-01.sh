# Filename : disable-ipv6-linode-01.sh
#
# Purpose  : To disable ipv6 for Ubuntu machines on Linode, a special approach is needed
#
# History :
# 2021-07-31  MEY Created.
# --------------------------------------------------------------------------------

# Get the colation of this script, used files are relative to this location
directory="$(dirname "$0")"

found_disable=`grep "net.ipv6.conf.all.disable_ipv6" /etc/sysctl.conf | wc -l`

#echo "$found_disable"

if [ "$found_disable" -ge "1" ]
 then
	clear
	echo -e "\n\n\n"
	echo "ipv6 allready disabled on this system"
 else
  clear
 	echo "net.ipv6.conf.all.disable_ipv6=1"     >> /etc/sysctl.conf
	echo "net.ipv6.conf.default.disable_ipv6=1" >> /etc/sysctl.conf
	echo "net.ipv6.conf.lo.disable_ipv6=1"      >> /etc/sysctl.conf

	/usr/sbin/sysctl -p

	# create the /etc/rc.local file

        echo "#! /bin/bash"               >  /etc/rc.local
	echo "#  /etc.rc.local"           >> /etc/rc.local
	echo "#"                          >> /etc/rc.local
	echo "/etc/sysctl.d"              >> /etc/rc.local
        echo "/etc/init.d/procps restart" >> /etc/rc.local
        echo "exit 0"                     >> /etc/rc.local
       
	chmod 755 /etc/rc.local

	echo -e "\n\n\n"
	echo "ipv6 disabled, system needs to be rebooted"
fi

#echo "$found_disable"
