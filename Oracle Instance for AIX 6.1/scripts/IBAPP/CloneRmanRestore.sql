SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool /oracle/admin/IBAPP/scripts/CloneRmanRestore.log append
startup nomount pfile="/oracle/admin/IBAPP/scripts/init.ora";
@/oracle/admin/IBAPP/scripts/rmanRestoreDatafiles.sql;
spool off
