SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool /oracle/admin/IBAPP/scripts/postDBCreation.log append
@/oracle/product/11.2.0.4/rdbms/admin/catbundleapply.sql;
select 'utl_recomp_begin: ' || to_char(sysdate, 'HH:MI:SS') from dual;
execute utl_recomp.recomp_serial();
select 'utl_recomp_end: ' || to_char(sysdate, 'HH:MI:SS') from dual;
execute dbms_swrf_internal.cleanup_database(cleanup_local => FALSE);
commit;
shutdown immediate;
connect "SYS"/"&&sysPassword" as SYSDBA
startup mount pfile="/oracle/admin/IBAPP/scripts/init.ora";
alter database archivelog;
alter database open;
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
create spfile='/oracle/product/11.2.0.4/dbs/spfileIBAPP.ora' FROM pfile='/oracle/admin/IBAPP/scripts/init.ora';
shutdown immediate;
connect "SYS"/"&&sysPassword" as SYSDBA
startup ;
host /oracle/product/11.2.0.4/bin/emca -config dbcontrol db -silent -DB_UNIQUE_NAME IBAPP -PORT 1521 -EM_HOME /oracle/product/11.2.0.4/ -LISTENER LISTENER -SERVICE_NAME IBAPP -SID IBAPP -ORACLE_HOME /oracle/product/11.2.0.4/ -HOST db1 -LISTENER_OH /oracle/product/11.2.0.4 -LOG_FILE /oracle/admin/IBAPP/scripts/emConfig.log;
spool off
exit;
