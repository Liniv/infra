#!/bin/sh

OLD_UMASK=`umask`
umask 0027
mkdir -p /radius/oratada/admin/IBRAD/adump
mkdir -p /radius/oratada/admin/IBRAD/dpdump
mkdir -p /radius/oratada/admin/IBRAD/pfile
mkdir -p /oracle/cfgtoollogs/dbca/IBRAD
mkdir -p /radius/oradata/fast_recovery_area
mkdir -p /radius/oradata/fast_recovery_area/IBRAD
mkdir -p /radius/oradata/IBRAD
mkdir -p /oracle/product/11.2.0/dbhome_1/dbs
umask ${OLD_UMASK}
ORACLE_SID=IBRAD; export ORACLE_SID
PATH=$ORACLE_HOME/bin:$PATH; export PATH
echo You should Add this entry in the /etc/oratab: IBRAD:/oracle/product/11.2.0/dbhome_1:Y
/oracle/product/11.2.0/dbhome_1/bin/sqlplus /nolog @/oracle/admin/IBRAD/scripts/IBRAD.sql
