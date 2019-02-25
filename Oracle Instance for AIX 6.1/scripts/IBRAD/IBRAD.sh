#!/bin/sh

OLD_UMASK=`umask`
umask 0027
mkdir -p /oracle/admin/IBRAD/adump
mkdir -p /oracle/admin/IBRAD/dpdump
mkdir -p /oracle/admin/IBRAD/pfile
mkdir -p /oracle/cfgtoollogs/dbca/IBRAD
mkdir -p /radius/IBRAD
mkdir -p /oracle/product/11.2.0.4//dbs
mkdir -p /radius/fast_recovery_area_IBRAD
mkdir -p /radius/fast_recovery_area_IBRAD/IBRAD
umask ${OLD_UMASK}
ORACLE_SID=IBRAD; export ORACLE_SID
PATH=$ORACLE_HOME/bin:$PATH; export PATH
echo You should Add this entry in the /etc/oratab: IBRAD:/oracle/product/11.2.0.4/:Y
/oracle/product/11.2.0.4/bin/sqlplus /nolog @/oracle/admin/IBRAD/scripts/IBRAD.sql
