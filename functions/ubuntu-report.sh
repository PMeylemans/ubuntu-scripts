#! /bin/bash
#
# Filename : ubuntu-report.sh
#
# Purpose  : To disable feed-back to the Ubuntu comunity about installed packages
#
# History :
# 2020-03-31  MEY Created.
# --------------------------------------------------------------------------------

# Get the colation of this script, used files are relative to this location
directory="$(dirname "$0")"

# read the include file for to remove packages
source $directory/remove_package.include

remove_package "ubuntu-report"
