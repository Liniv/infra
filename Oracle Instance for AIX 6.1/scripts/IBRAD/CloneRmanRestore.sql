SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool /oracle/admin/IBRAD/scripts/CloneRmanRestore.log append
startup nomount pfile="/oracle/admin/IBRAD/scripts/init.ora";
@/oracle/admin/IBRAD/scripts/rmanRestoreDatafiles.sql;
spool off
