#! /bin/bash
#
# Filename : set_timezone.sh
#
# Purpose  : set the timezone to Europe Brussels
#
# History :
# 2020-04-13  MEY Created.
# ---------------------------------------------------------------------------

clear
echo -e "\n\n\n"
timedatectl set-timezone Europe/Brussels
echo -e "\n\n\n"
echo "Timezode set to Europe/Brussels"
timedatectl
