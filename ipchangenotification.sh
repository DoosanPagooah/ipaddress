#!/bin/bash
# check and send ip address to email
 
MYIP=`dig +short myip.opendns.com @resolver1.opendns.com`;
TIME=`date`;
 
LASTIPFILE='/home/doosan/bin/.last_ip_addr';
LASTIP=`cat ${LASTIPFILE}`;
 
if [[ ${MYIP} != ${LASTIP} ]]
then
        echo "New IP = ${MYIP}"
        echo "Updating Github witn New Public IP"
        echo ${MYIP} > ${LASTIPFILE};
        git remote add origin https://DoosanPagooah:mDE-fA'qc3E[Y5Hg@github.com/DoosanPagooah/ipaddress.git
        git push -u origin master -all 
else
        echo "no IP change!"
fi
