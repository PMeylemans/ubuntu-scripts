#! /bin/bash
#
# Filename : disable_firewall.sh
#
# Purpose  : To disable firewall of the system, only use on internal servers
#
# History :
# 2020-04-02  MEY Created.
# ---------------------------------------------------------------------------

clear
echo -e "\n\n\n"
ufw disable
systemctl stop ufw
echo -e "\n\n\n"
echo "Firewall has been disabled"
