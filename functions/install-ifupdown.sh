#! /bin/bash
#
# Filename : install-ifupdown.sh
#
# Purpose  : Install tools to enabple ifdown & ifup commands
#
# History :
# 2021-08-01  MEY Created.
# --------------------------------------------------------------------------------

# Get the colation of this script, used files are relative to this location
directory="$(dirname "$0")"

# read the include file for to remove packages
source $directory/remove_package.include

apt install ifupdown  -y

clear
echo -e "\n\n\n"
echo "ifupdown installed, you can now use it e.g. ifdown & ifup)"
echo "---------------------------------------------------------------"
echo -e "\n\n\n"

