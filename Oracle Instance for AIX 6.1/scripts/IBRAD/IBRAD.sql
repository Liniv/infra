set verify off
ACCEPT sysPassword CHAR PROMPT 'Enter new password for SYS: ' HIDE
ACCEPT systemPassword CHAR PROMPT 'Enter new password for SYSTEM: ' HIDE
ACCEPT sysmanPassword CHAR PROMPT 'Enter new password for SYSMAN: ' HIDE
ACCEPT dbsnmpPassword CHAR PROMPT 'Enter new password for DBSNMP: ' HIDE
host /oracle/product/11.2.0.4/bin/orapwd file=/oracle/product/11.2.0.4/dbs/orapwIBRAD force=y
@/oracle/admin/IBRAD/scripts/CloneRmanRestore.sql                     
@/oracle/admin/IBRAD/scripts/cloneDBCreation.sql
@/oracle/admin/IBRAD/scripts/postScripts.sql
@/oracle/admin/IBRAD/scripts/lockAccount.sql
@/oracle/admin/IBRAD/scripts/postDBCreation.sql
