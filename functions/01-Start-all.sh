#! /bin/bash
#
# Filename : 01-start-all.sh
#
# Purpose  : fire all the scripts with only one command
#
# History  :
# 2020-07-19 mey created
# ------------------------------------------------------

echo "Apport"
./apport.sh
sleep 3

echo "Disable firewall"
./disable_firewall.sh
sleep 3


echo "Disable IPv6"
./disable-ipv6.sh
sleep 3

echo "Enable root"
./enable_root.sh
sleep 3

echo "Install netscript"
./install-netscript.sh
sleep 3

echo "Install net tools"
./install-net-tools.sh
sleep 3


echo "Install ssh enable root"
./install_sshd_enable_root.sh
sleep 3

echo "Polularity"
./popularity.sh
sleep 3

echo "Set Timezone"
./set_timezone.sh
sleep 3

echo "Ubuntu Report"
./ubuntu-report.sh
sleep 3


