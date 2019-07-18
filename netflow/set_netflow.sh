#!/bin/bash

# delay 15 sec
ping localhost -c 10
chmod 777 /nfsshares/netflow_data
# getting data from dump
#docker exec nfcapd nfdump -R /data/$(date +%Y)/$(date +%m)/$(date +%d)/nfcapd.$(date +'%Y%m%d%H%M' -d "now -1 minutes") -N -o fmt:%ts,%sa,%da,%byt -q >> /nfsshares/netflow_data/netflow.csv
nfdump -R /nfsshares/netflow_data/$(date +%Y)/$(date +%m)/$(date +%d)/nfcapd.$(date +'%Y%m%d%H%M' -d "now -1 minutes") -N -o fmt:%ts,%sa,%da,%byt -q >> /nfsshares/netflow_data/netflow.csv
chmod 777 /nfsshares/netflow_data/netflow.csv
# connect to Oracle_AIX
#docker run --rm -e 'URL=flowuser/12345$@//10.90.2.23:1521/ibapp' sflyr/sqlplus

scp -c blowfish -C -P 8115 /nfsshares/netflow_data/netflow.csv root@oratestmtisf.icdc.io:/nfdumpexp/igorzabiraj.csv

docker run --rm -e 'URL=flowuser/12345$@//oratestmtisf.icdc.io:8114/ORCL' sflyr/sqlplus

rm -rf /nfsshares/netflow_data/netflow.csv