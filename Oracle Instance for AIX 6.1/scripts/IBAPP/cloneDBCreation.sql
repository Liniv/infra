SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool /oracle/admin/IBAPP/scripts/cloneDBCreation.log append
Create controlfile reuse set database "IBAPP"
MAXINSTANCES 8
MAXLOGHISTORY 1
MAXLOGFILES 16
MAXLOGMEMBERS 3
MAXDATAFILES 100
Datafile 
'/webapp/oradata/IBAPP/system01.dbf',
'/webapp/oradata/IBAPP/sysaux01.dbf',
'/webapp/oradata/IBAPP/undotbs01.dbf',
'/webapp/oradata/IBAPP/users01.dbf'
LOGFILE GROUP 1 ('/webapp/oradata/IBAPP/redo01.log') SIZE 51200K,
GROUP 2 ('/webapp/oradata/IBAPP/redo02.log') SIZE 51200K,
GROUP 3 ('/webapp/oradata/IBAPP/redo03.log') SIZE 51200K RESETLOGS;
exec dbms_backup_restore.zerodbid(0);
shutdown immediate;
startup nomount pfile="/oracle/admin/IBAPP/scripts/initIBAPPTemp.ora";
Create controlfile reuse set database "IBAPP"
MAXINSTANCES 8
MAXLOGHISTORY 1
MAXLOGFILES 16
MAXLOGMEMBERS 3
MAXDATAFILES 100
Datafile 
'/webapp/oradata/IBAPP/system01.dbf',
'/webapp/oradata/IBAPP/sysaux01.dbf',
'/webapp/oradata/IBAPP/undotbs01.dbf',
'/webapp/oradata/IBAPP/users01.dbf'
LOGFILE GROUP 1 ('/webapp/oradata/IBAPP/redo01.log') SIZE 51200K,
GROUP 2 ('/webapp/oradata/IBAPP/redo02.log') SIZE 51200K,
GROUP 3 ('/webapp/oradata/IBAPP/redo03.log') SIZE 51200K RESETLOGS;
alter system enable restricted session;
alter database "IBAPP" open resetlogs;
exec dbms_service.delete_service('seeddata');
exec dbms_service.delete_service('seeddataXDB');
alter database rename global_name to "IBAPP";
ALTER TABLESPACE TEMP ADD TEMPFILE '/webapp/oradata/IBAPP/temp01.dbf' SIZE 20480K REUSE AUTOEXTEND ON NEXT 640K MAXSIZE UNLIMITED;
select tablespace_name from dba_tablespaces where tablespace_name='USERS';
select sid, program, serial#, username from v$session;
alter database character set INTERNAL_CONVERT AL32UTF8;
alter database national character set INTERNAL_CONVERT AL16UTF16;
alter user sys account unlock identified by "&&sysPassword";
alter user system account unlock identified by "&&systemPassword";
alter system disable restricted session;
