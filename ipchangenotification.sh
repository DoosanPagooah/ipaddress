#!/bin/bash
# check and send ip address to email
# Changes Version 2  
MYIP=`dig +short myip.opendns.com @resolver1.opendns.com`;
 
LASTIPFILE='/home/doosan/bin/.last_ip_addr';
LASTIP=`cat ${LASTIPFILE}`;
 
if [[ ${MYIP} != ${LASTIP} ]]
then
        echo "New IP = ${MYIP}"
        echo "Updating Github witn New Public IP"
        echo ${MYIP} > ${LASTIPFILE};
        cd /home/doosan/bin
        git add -A
        git commit -am "Updated Script"
        git push
else
        echo "no IP change!"
fi
