set verify off
ACCEPT sysPassword CHAR PROMPT 'Enter new password for SYS: ' HIDE
ACCEPT systemPassword CHAR PROMPT 'Enter new password for SYSTEM: ' HIDE
ACCEPT sysmanPassword CHAR PROMPT 'Enter new password for SYSMAN: ' HIDE
ACCEPT dbsnmpPassword CHAR PROMPT 'Enter new password for DBSNMP: ' HIDE
host /opt/app/oracle/product/11.2.0/dbhome_1/bin/orapwd file=/opt/app/oracle/product/11.2.0/dbhome_1/dbs/orapwIBRAD force=y
@/opt/app/oracle/admin/IBRAD/scripts/CloneRmanRestore.sql
@/opt/app/oracle/admin/IBRAD/scripts/cloneDBCreation.sql
@/opt/app/oracle/admin/IBRAD/scripts/postScripts.sql
@/opt/app/oracle/admin/IBRAD/scripts/lockAccount.sql
@/opt/app/oracle/admin/IBRAD/scripts/postDBCreation.sql
