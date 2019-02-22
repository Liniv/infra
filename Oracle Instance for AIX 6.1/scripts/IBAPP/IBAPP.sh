#!/bin/sh

OLD_UMASK=`umask`
umask 0027
mkdir -p /oracle/admin/IBAPP/adump
mkdir -p /oracle/admin/IBAPP/dpdump
mkdir -p /oracle/admin/IBAPP/pfile
mkdir -p /oracle/cfgtoollogs/dbca/IBAPP
mkdir -p /webapp/IBAPP
mkdir -p /oracle/product/11.2.0.4/dbs
mkdir -p /webapp/fast_recovery_area
mkdir -p /webapp/fast_recovery_area/IBAPP
umask ${OLD_UMASK}
ORACLE_SID=IBAPP; export ORACLE_SID
PATH=$ORACLE_HOME/bin:$PATH; export PATH
echo You should Add this entry in the /etc/oratab: IBAPP:/oracle/product/11.2.0.4/:Y
/oracle/product/11.2.0.4/bin/sqlplus /nolog @/oracle/admin/IBAPP/scripts/IBAPP.sql
