#! /bin/bash
#
# Filename : install-net-tools.sh
#
# Purpose  : Install tools to enable netstat. ...
#
# History :
# 2020-06-02  MEY Created.
# --------------------------------------------------------------------------------

# Get the colation of this script, used files are relative to this location
directory="$(dirname "$0")"

# read the include file for to remove packages
source $directory/remove_package.include

apt install net-tools -y

clear
echo -e "\n\n\n"
echo "net-tools installed, you can now use it e.g. netstat)"
echo "-----------------------------------------------------"
echo -e "\n\n\n"

