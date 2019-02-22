SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool /oracle/admin/IBRAD/scripts/cloneDBCreation.log append
Create controlfile reuse set database "IBRAD"
MAXINSTANCES 8
MAXLOGHISTORY 1
MAXLOGFILES 16
MAXLOGMEMBERS 3
MAXDATAFILES 100
Datafile 
'/radius/IBRAD/system01.dbf',
'/radius/IBRAD/sysaux01.dbf',
'/radius/IBRAD/undotbs01.dbf',
'/radius/IBRAD/users01.dbf'
LOGFILE GROUP 1 ('/radius/IBRAD/redo01.log') SIZE 51200K,
GROUP 2 ('/radius/IBRAD/redo02.log') SIZE 51200K,
GROUP 3 ('/radius/IBRAD/redo03.log') SIZE 51200K RESETLOGS;
exec dbms_backup_restore.zerodbid(0);
shutdown immediate;
startup nomount pfile="/oracle/admin/IBRAD/scripts/initIBRADTemp.ora";
Create controlfile reuse set database "IBRAD"
MAXINSTANCES 8
MAXLOGHISTORY 1
MAXLOGFILES 16
MAXLOGMEMBERS 3
MAXDATAFILES 100
Datafile 
'/radius/IBRAD/system01.dbf',
'/radius/IBRAD/sysaux01.dbf',
'/radius/IBRAD/undotbs01.dbf',
'/radius/IBRAD/users01.dbf'
LOGFILE GROUP 1 ('/radius/IBRAD/redo01.log') SIZE 51200K,
GROUP 2 ('/radius/IBRAD/redo02.log') SIZE 51200K,
GROUP 3 ('/radius/IBRAD/redo03.log') SIZE 51200K RESETLOGS;
alter system enable restricted session;
alter database "IBRAD" open resetlogs;
exec dbms_service.delete_service('seeddata');
exec dbms_service.delete_service('seeddataXDB');
alter database rename global_name to "IBRAD";
ALTER TABLESPACE TEMP ADD TEMPFILE '/radius/IBRAD/temp01.dbf' SIZE 20480K REUSE AUTOEXTEND ON NEXT 640K MAXSIZE UNLIMITED;
select tablespace_name from dba_tablespaces where tablespace_name='USERS';
select sid, program, serial#, username from v$session;
alter database character set INTERNAL_CONVERT AL32UTF8;
alter database national character set INTERNAL_CONVERT AL16UTF16;
alter user sys account unlock identified by "&&sysPassword";
alter user system account unlock identified by "&&systemPassword";
alter system disable restricted session;
