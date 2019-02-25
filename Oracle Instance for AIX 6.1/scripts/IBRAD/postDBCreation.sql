SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool /oracle/admin/IBRAD/scripts/postDBCreation.log append
@/oracle/product/11.2.0/dbhome_1/rdbms/admin/catbundleapply.sql;
select 'utl_recomp_begin: ' || to_char(sysdate, 'HH:MI:SS') from dual;
execute utl_recomp.recomp_serial();
select 'utl_recomp_end: ' || to_char(sysdate, 'HH:MI:SS') from dual;
execute dbms_swrf_internal.cleanup_database(cleanup_local => FALSE);
commit;
shutdown immediate;
connect "SYS"/"&&sysPassword" as SYSDBA
startup mount pfile="/oracle/admin/IBRAD/scripts/init.ora";
alter database archivelog;
alter database open;
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
create spfile='/oracle/product/11.2.0/dbhome_1/dbs/spfileIBRAD.ora' FROM pfile='/oracle/admin/IBRAD/scripts/init.ora';
shutdown immediate;
connect "SYS"/"&&sysPassword" as SYSDBA
startup ;
host /oracle/product/11.2.0/dbhome_1/bin/emca -config dbcontrol db -silent -DB_UNIQUE_NAME IBRAD -PORT 1522 -EM_HOME /oracle/product/11.2.0/dbhome_1 -LISTENER LISTENER_IBRAD -SERVICE_NAME IBRAD -SID IBRAD -ORACLE_HOME /oracle/product/11.2.0/dbhome_1 -HOST 3d-ztemtis-ora -LISTENER_OH /oracle/product/11.2.0/dbhome_1 -LOG_FILE /oracle/admin/IBRAD/scripts/emConfig.log;
spool off
exit;
