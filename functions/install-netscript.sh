#! /bin/bash
#
# Filename : install-netscript.sh
#
# Purpose  : Install tools to enabple ifdown & ifup commands
#
# History :
# 2020-04-03  MEY Created.
# --------------------------------------------------------------------------------

# Get the colation of this script, used files are relative to this location
directory="$(dirname "$0")"

# read the include file for to remove packages
source $directory/remove_package.include

apt install netscript-2.4 -y

clear
echo -e "\n\n\n"
echo "netscript 2-4 installed, you can now use it e.g. ifdown & ifup)"
echo "---------------------------------------------------------------"
echo -e "\n\n\n"

