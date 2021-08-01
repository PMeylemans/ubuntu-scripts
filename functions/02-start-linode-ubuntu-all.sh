#! /bin/bash
#
# Filename :02-start-linode-ubuntu-all.sh 
#
# Purpose  : fire all the scripts for Linode Ubuntu machines with only one command
#
# History  :
# 2021-08-01 mey created
# --------------------------------------------------------------------------------

echo "Apport"
./apport.sh
sleep 3

echo "Disable firewall"
./disable_firewall.sh
sleep 3

echo "Disable IPv6 (On Linode Ubuntu)"
./disable-ipv6-linode-01.sh
sleep 3

echo "Install ifupdown"
./install-ifupdown.sh
sleep 3

echo "Install net tools"
./install-net-tools.sh
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


