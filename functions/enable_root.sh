#! /bin/bash
#
# Filename : enable_root.sh
#
# Purpose  : To disable feed-back to the Ubuntu comunity about installed packages
#
# History :
# 2020-04-01  MEY Created.
# --------------------------------------------------------------------------------

# Get the colation of this script, used files are relative to this location
directory="$(dirname "$0")"

# Actions needed to enable the root account on a Ubuntu system
# You have to provide a password
# before starting this script you must be in sudo -i mode

passwd root
passwd -u root

# remove_package "apport"

