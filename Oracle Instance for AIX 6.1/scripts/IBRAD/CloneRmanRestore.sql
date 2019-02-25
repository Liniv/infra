SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool /opt/app/oracle/admin/IBRAD/scripts/CloneRmanRestore.log append
startup nomount pfile="/opt/app/oracle/admin/IBRAD/scripts/init.ora";
@/opt/app/oracle/admin/IBRAD/scripts/rmanRestoreDatafiles.sql;
spool off
