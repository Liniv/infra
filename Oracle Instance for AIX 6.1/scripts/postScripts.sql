SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool /oracle/admin/IBAPP/scripts/postScripts.log append
@/oracle/product/11.2.0.4/rdbms/admin/dbmssml.sql;
execute dbms_datapump_utl.replace_default_dir;
commit;
connect "SYS"/"&&sysPassword" as SYSDBA
alter session set current_schema=ORDSYS;
@/oracle/product/11.2.0.4/ord/im/admin/ordlib.sql;
alter session set current_schema=SYS;
create or replace directory XMLDIR as '/oracle/product/11.2.0.4/rdbms/xml';
connect "SYS"/"&&sysPassword" as SYSDBA
connect "SYS"/"&&sysPassword" as SYSDBA
execute ORACLE_OCM.MGMT_CONFIG_UTL.create_replace_dir_obj;
