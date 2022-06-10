#! /bin/bash

# Filename /users/cron/scripts/create_daily_server_report.sh
#
# Purpose  To create a daily report and store it in a file 
#
# History  20220531 MEY created
#          20220602 MEY added some more logging
#          20220610 MEY add loop through all Odoo databases of the server (to be finalized)
# ----------------------------------------------------------------------------------------

# Variable section
# ----------------

SERVER="Odoo Test"				# Used as header in the file
FREEDISKSPACE="0"				# initialize
DATABASELIST=" "				# list with all Odoo databases
DATABASES=" "					# Will become the array with databases
ODOODATABASE="crystal-ext"			# database name (must exist)
NUMBEROFFILES="0"				# initialize
FAILDLOGINS="0"					# initialize
LOCATION="/var/log/daily_reports/"		# must exist, where the reports are created
REPORTNAME=$LOCATION`date +%Y-%m-%d`.txt	# Name of the daily report
XMLRPCCALS="0"					# initialize
NTFYCHANNEL="_mey_"				# Channel on https://ntfy.sh must exist
LOGFORSHELL=" "					# initialize

# Create the report and write the header information
# --------------------------------------------------

echo "Server Report data for $SERVER" > $REPORTNAME 
echo "" >> $REPORTNAME


## Free diskspace
## -------------

FREEDISKSPACE=$(df -h | awk '$6 == "/"')
printf "%s\n" ">> Free disk space:" >> $REPORTNAME
printf "%s " $FREEDISKSPACE >> $REPORTNAME
printf "%s\n" >> $REPORTNAME

## Odoo databases
## --------------

DATABASELIST=`sudo -u postgres bash -c 'psql -l' | grep odoo | cut -d' ' -f2`
DATABASES=($DATABASELIST)

for ODOODATABASE in "${DATABASES[@]}"
do
 echo $ODOODATABASE
 # CODE INSIDE THIS LOOP
done

## Number of files in the Odoo filestore
## -------------------------------------

NUMBEROFFILES=`find /users/odoo/data/filestore/$ODOODATABASE/. -type f | wc -l`
printf "%s\n" ">> Number of files in the $ODOODATASBE store" >> $REPORTNAME
printf "%s " $NUMBEROFFILES >> $REPORTNAME
printf "%s\n" >> $REPORTNAME

## Login fails in ODOO
## -------------------

FAILDLOGINS=`grep "Login failed" /var/log/odoo/odoo-server.log | cut -d' ' -f11,13 | sort | uniq -c`
printf "%s\n" ">> Logins Failed in ODOO" >> $REPORTNAME
printf "%s\n" "${FAILDLOGINS[@]}" >> $REPORTNAME
printf "%s\n" >> $REPORTNAME

## Number of xmlrpc calls by GCCW checked by part of the IP adress
## ---------------------------------------------------------------

XMLRPCCALLS=`grep xmlrpc /var/log/nginx/odoo.access.log | grep 192.168 | wc -l`
printf "%s\n" ">> Number of xmlrpc calls by GCCW" >> $REPORTNAME
printf "%s " $XMLRPCCALLS >> $REPORTNAME
printf "%s\n" >> $REPORTNAME

## Number of xmlrpc call by others (externals)
## -------------------------------------------

XMLRPCCALLS=`grep xmlrpc /var/log/nginx/odoo.access.log | grep -v 192.168 | wc -l`
printf "%s\n" ">> Number of xmlrpc calls by others !!!" >> $REPORTNAME
printf "%s " $XMLRPCCALLS >> $REPORTNAME
printf "%s\n" >> $REPORTNAME


## Log4Shell exploid
## -----------------
LOGFORSHELL=`grep {jndi:ldap /var/log/nginx/odoo.access.log`
printf "%s\n" ">> Log4shell attempts" >> $REPORTNAME
printf "%s\n" "${LOGFORSHELL[@]}" >> $REPORTNAME
printf "%s\n" >> $REPORTNAME

## Send to ntfy server
## -------------------

curl --data-binary "@$REPORTNAME" ntfy.sh/$NTFYCHANNEL >/dev/null 2>&1

## test output
