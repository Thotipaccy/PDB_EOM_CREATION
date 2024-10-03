Microsoft Windows [Version 10.0.22631.4169]
(c) Microsoft Corporation. All rights reserved.

C:\Windows\System32>sqlplus sys as sysdba

SQL*Plus: Release 21.0.0.0.0 - Production on Thu Oct 3 18:16:40 2024
Version 21.3.0.0.0

Copyright (c) 1982, 2021, Oracle.  All rights reserved.

Enter password:

Connected to:
Oracle Database 21c Enterprise Edition Release 21.0.0.0.0 - Production
Version 21.3.0.0.0

SQL> show user
USER is "SYS"
SQL> select instance_name from v$instance;

INSTANCE_NAME
----------------
orcl

SQL> show pdbs

    CON_ID CON_NAME                       OPEN MODE  RESTRICTED
---------- ------------------------------ ---------- ----------
         2 PDB$SEED                       READ ONLY  NO
         3 ORA21C                         READ WRITE NO



SQL> select con_id, tablespace_name, file_name from cdb_data_files;

    CON_ID TABLESPACE_NAME
---------- ------------------------------
FILE_NAME
--------------------------------------------------------------------------------
         1 SYSTEM
C:\USERS\PC\DOCUMENTS\SQL 1\ORCL\DATAFILE\O1_MF_SYSTEM_MHON8HNL_.DBF

         1 SYSAUX
C:\USERS\PC\DOCUMENTS\SQL 1\ORCL\DATAFILE\O1_MF_SYSAUX_MHOND4KV_.DBF

         1 UNDOTBS1
C:\USERS\PC\DOCUMENTS\SQL 1\ORCL\DATAFILE\O1_MF_UNDOTBS1_MHONFLKW_.DBF


    CON_ID TABLESPACE_NAME
---------- ------------------------------
FILE_NAME
--------------------------------------------------------------------------------
         1 USERS
C:\USERS\PC\DOCUMENTS\SQL 1\ORCL\DATAFILE\O1_MF_USERS_MHONFMY8_.DBF

         3 SYSTEM
C:\USERS\PC\DOCUMENTS\SQL 1\ORCL\32EFB1BA2D6D4FCB9FF7A938F5D5F71B\DATAFILE\O1_MF
_SYSTEM_MHOOSHZ3_.DBF

         3 SYSAUX
C:\USERS\PC\DOCUMENTS\SQL 1\ORCL\32EFB1BA2D6D4FCB9FF7A938F5D5F71B\DATAFILE\O1_MF

    CON_ID TABLESPACE_NAME
---------- ------------------------------
FILE_NAME
--------------------------------------------------------------------------------
_SYSAUX_MHOOSJFG_.DBF

         3 UNDOTBS1
C:\USERS\PC\DOCUMENTS\SQL 1\ORCL\32EFB1BA2D6D4FCB9FF7A938F5D5F71B\DATAFILE\O1_MF
_UNDOTBS1_MHOOSJGY_.DBF

         3 USERS
C:\USERS\PC\DOCUMENTS\SQL 1\ORCL\32EFB1BA2D6D4FCB9FF7A938F5D5F71B\DATAFILE\O1_MF
_USERS_MHOOXMYK_.DBF

    CON_ID TABLESPACE_NAME
---------- ------------------------------
FILE_NAME
--------------------------------------------------------------------------------


8 rows selected.

SQL> select con_id, tablespace_name, file_name from cdb_data_files
  2  where con_id = 3;

    CON_ID TABLESPACE_NAME
---------- ------------------------------
FILE_NAME
--------------------------------------------------------------------------------
         3 SYSTEM
C:\USERS\PC\DOCUMENTS\SQL 1\ORCL\32EFB1BA2D6D4FCB9FF7A938F5D5F71B\DATAFILE\O1_MF
_SYSTEM_MHOOSHZ3_.DBF

         3 SYSAUX
C:\USERS\PC\DOCUMENTS\SQL 1\ORCL\32EFB1BA2D6D4FCB9FF7A938F5D5F71B\DATAFILE\O1_MF
_SYSAUX_MHOOSJFG_.DBF

         3 UNDOTBS1

    CON_ID TABLESPACE_NAME
---------- ------------------------------
FILE_NAME
--------------------------------------------------------------------------------
C:\USERS\PC\DOCUMENTS\SQL 1\ORCL\32EFB1BA2D6D4FCB9FF7A938F5D5F71B\DATAFILE\O1_MF
_UNDOTBS1_MHOOSJGY_.DBF

         3 USERS
C:\USERS\PC\DOCUMENTS\SQL 1\ORCL\32EFB1BA2D6D4FCB9FF7A938F5D5F71B\DATAFILE\O1_MF
_USERS_MHOOXMYK_.DBF




SQL> ALTER SYSTEM SET db_create_file_dest='C:\Users\PC\Documents\SQL 1\ORCL\' SCOPE=BOTH;

System altered.

SQL> ALTER SYSTEM SET db_create_online_log_dest_1='C:\Users\PC\Documents\SQL 1\ORCL\' SCOPE=BOTH;

System altered.

SQL> CREATE PLUGGABLE DATABASE plsql_2024db  ADMIN USER th_plsqlauca IDENTIFIED BY 1234;

Pluggable database created.

SQL>
SQL> SELECT pdb_name, status from cdb__pdbs;
SELECT pdb_name, status from cdb__pdbs
                             *
ERROR at line 1:
ORA-00942: table or view does not exist


SQL> SELECT pdb_name, status from cdb_pdbs;

PDB_NAME
--------------------------------------------------------------------------------
STATUS
----------
ORA21C
NORMAL

PDB$SEED
NORMAL

PLSQL_2024DB
NEW


SQL> select name, open_mode from v$pdbs;

NAME
--------------------------------------------------------------------------------
OPEN_MODE
----------
PDB$SEED
READ ONLY

ORA21C
READ WRITE

PLSQL_2024DB
MOUNTED


SQL> select name, con_id from v$active_services order by 1;

NAME                                                                 CON_ID
---------------------------------------------------------------- ----------
SYS$BACKGROUND                                                            1
SYS$USERS                                                                 1
ora21c                                                                    3
orcl                                                                      1
orclXDB                                                                   1
plsql_2024db                                                              4

6 rows selected.

SQL> alter pluggable database plsql_2024db open;

Pluggable database altered.

SQL>
SQL> SHOW CON_NAME;

CON_NAME
------------------------------
CDB$ROOT
SQL>
SQL>
SQL> SELECT NAME, OPEN_MODE FROM V$PDBS;

NAME
--------------------------------------------------------------------------------
OPEN_MODE
----------
PDB$SEED
READ ONLY

ORA21C
READ WRITE

PLSQL_2024DB
READ WRITE


SQL> ALTER PLUGGABLE DATABASE PLSQL_2024DB SAVE STATE;

Pluggable database altered.

SQL> SELECT INSTANCE_NAME FROM V$INSTANCE;

INSTANCE_NAME
----------------
orcl

SQL> ALTER SYSTEM SET db_create_file_dest='' SCOPE=BOTH;

System altered.



SQL> ALTER SYSTEM SET db_create_file_dest='C:\Users\PC\Documents\SQL 1\ORCL\' SCOPE=BOTH;

System altered.

SQL> ALTER SYSTEM SET db_create_online_log_dest_1='C:\Users\PC\Documents\SQL 1\ORCL\' SCOPE=BOTH;

System altered.

SQL> CREATE PLUGGABLE DATABASE th_to_delete_pdb  ADMIN USER th_delete_user IDENTIFIED BY 1234;

Pluggable database created.

SQL> SELECT PDB_NAME, STATUS FROM CDB_PDBS;

PDB_NAME
--------------------------------------------------------------------------------
STATUS
----------
ORA21C
NORMAL

PDB$SEED
NORMAL

PLSQL_2024DB
NORMAL


PDB_NAME
--------------------------------------------------------------------------------
STATUS
----------
TH_TO_DELETE_PDB
NEW


SQL> SELECT NAME, OPEN_MODE FROM V$PDBS;

NAME
--------------------------------------------------------------------------------
OPEN_MODE
----------
PDB$SEED
READ ONLY

ORA21C
READ WRITE

PLSQL_2024DB
READ WRITE


NAME
--------------------------------------------------------------------------------
OPEN_MODE
----------
TH_TO_DELETE_PDB
MOUNTED


SQL> ALTER PLUGGABLE DATABASE th_to_delete_pdb open;

Pluggable database altered.

SQL> SELECT NAME, OPEN_MODE FROM V$PDBS;

NAME
--------------------------------------------------------------------------------
OPEN_MODE
----------
PDB$SEED
READ ONLY

ORA21C
READ WRITE

PLSQL_2024DB
READ WRITE


NAME
--------------------------------------------------------------------------------
OPEN_MODE
----------
TH_TO_DELETE_PDB
READ WRITE


SQL> ALTER PLUGGABLE DATABASE th_to_delete_pdb SAVE STATE;

Pluggable database altered.

SQL> SELECT instance_name from v$instance;

INSTANCE_NAME
----------------
orcl

SQL> col name for a20;
SQL> /

INSTANCE_NAME
----------------
orcl

SQL> exit
Disconnected from Oracle Database 21c Enterprise Edition Release 21.0.0.0.0 - Production
Version 21.3.0.0.0

C:\Windows\System32>SQL> col name for a20
SQL> /
SP2-0103: Nothing in SQL buffer to run.
SQL>
SQL> select name, open_mode from v$containers
  2  /

NAME                 OPEN_MODE
-------------------- ----------
CDB$ROOT             READ WRITE
PDB$SEED             READ ONLY
ORA21C               READ WRITE
PLSQL_2024DB         READ WRITE
TH_TO_DELETE_PDB     READ WRITE

SQL> ALTER PLUGGABLE DATABASE th_to_delete_pdb close immediate;

Pluggable database altered.

SQL> select directory_name, directory_path from dba_directories;

DIRECTORY_NAME
--------------------------------------------------------------------------------
DIRECTORY_PATH
--------------------------------------------------------------------------------
ORACLECLRDIR
C:\setup\WINDOWS.X64_213000_db_home\bin\clr

SDO_DIR_ADMIN
C:\setup\WINDOWS.X64_213000_db_home/md/admin

XMLDIR
C:\setup\WINDOWS.X64_213000_db_home\rdbms\xml


DIRECTORY_NAME
--------------------------------------------------------------------------------
DIRECTORY_PATH
--------------------------------------------------------------------------------
XSDDIR
C:\setup\WINDOWS.X64_213000_db_home\rdbms\xml\schema

ORACLE_OCM_CONFIG_DIR2
C:\setup\app\paccy\homes\OraDB21Home1\ccr\state

ORACLE_OCM_CONFIG_DIR
C:\setup\app\paccy\homes\OraDB21Home1\ccr\state


DIRECTORY_NAME
--------------------------------------------------------------------------------
DIRECTORY_PATH
--------------------------------------------------------------------------------
ORACLE_BASE
C:\setup\app\paccy

ORACLE_HOME
C:\setup\WINDOWS.X64_213000_db_home

OPATCH_INST_DIR
C:\setup\WINDOWS.X64_213000_db_home\OPatch


DIRECTORY_NAME
--------------------------------------------------------------------------------
DIRECTORY_PATH
--------------------------------------------------------------------------------
DATA_PUMP_DIR
C:\setup\app\paccy\admin\orcl\dpdump/

DBMS_OPTIM_LOGDIR
C:\setup\WINDOWS.X64_213000_db_home/cfgtoollogs

DBMS_OPTIM_ADMINDIR
C:\setup\WINDOWS.X64_213000_db_home/rdbms/admin


DIRECTORY_NAME
--------------------------------------------------------------------------------
DIRECTORY_PATH
--------------------------------------------------------------------------------
OPATCH_SCRIPT_DIR
C:\setup\WINDOWS.X64_213000_db_home\QOpatch

OPATCH_LOG_DIR
C:\setup\app\paccy\homes\OraDB21Home1\rdbms\log

JAVA$JOX$CUJS$DIRECTORY$
C:\SETUP\WINDOWS.X64_213000_DB_HOME\JAVAVM\ADMIN\


15 rows selected.

SQL> ALTER PLUGGABLE DATABASE th_to_delete_pdb unplug into 'C:\setup\app\paccy\admin\orcl\dpdump\th_to_delete_pdb.xml';

Pluggable database altered.

SQL> DROP PLUGGABLE DATABASE th_to_delete_pdb INCLUDING DATAFILES;

Pluggable database dropped.

SQL>
SQL>
SQL> SELECT NAME, OPEN_MODE FROM V$CONTAINERS;

NAME                 OPEN_MODE
-------------------- ----------
CDB$ROOT             READ WRITE
PDB$SEED             READ ONLY
ORA21C               READ WRITE
PLSQL_2024DB         READ WRITE

SQL>

SQL> show con_name;

CON_NAME
------------------------------
CDB$ROOT
SQL> alter session set container = CDB$ROOT;

Session altered.

SQL> SELECT SYS_CONTEXT('USERENV', 'CON_NAME') AS current_container FROM dual;

CURRENT_CONTAINER
--------------------------------------------------------------------------------
CDB$ROOT

SQL> select DBMS_XDB_CONFIG.GETHTTPPORT() AS HTTP_PORT,
  2         DBMS_XDB_CONFIG.GETHTTPSPORT() AS HTTPS_PORT
  3  FROM dual;

 HTTP_PORT HTTPS_PORT
---------- ----------
         0          0

SQL>
SQL> BEGIN
  2       DBMS_XDB_CONFIG.SETHTTPPORT(8080);
  3       DBMS_XDB_CONFIG.SETHTTPSPORT(8443)
  4  ;
  5  END;
  6  /

PL/SQL procedure successfully completed.

SQL>
SQL> select DBMS_XDB_CONFIG.GETHTTPPORT() AS HTTP_PORT,
  2         DBMS_XDB_CONFIG.GETHTTPSPORT() AS HTTPS_PORT
  3  FROM dual;

 HTTP_PORT HTTPS_PORT
---------- ----------
      8080       8443

SQL> EXIT
Disconnected from Oracle Database 21c Enterprise Edition Release 21.0.0.0.0 - Production
Version 21.3.0.0.0

C:\Windows\System32>lsnrctl status | findstr HOST
Connecting to (ADDRESS=(PROTOCOL=tcp)(HOST=)(PORT=1521))
  (DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=THOTI)(PORT=1521)))
  (DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=THOTI)(PORT=8080))(Presentation=HTTP)(Session=RAW))
  (DESCRIPTION=(ADDRESS=(PROTOCOL=tcps)(HOST=THOTI)(PORT=8443))(Security=(my_wallet_directory=C:\SETUP\APP\PACCY\admin\orcl\xdb_wallet))(Presentation=HTTP)(Session=RAW))

C:\Windows\System32>SQLPLUS SYS AS SYSDBA

SQL*Plus: Release 21.0.0.0.0 - Production on Thu Oct 3 23:16:15 2024
Version 21.3.0.0.0

Copyright (c) 1982, 2021, Oracle.  All rights reserved.

Enter password:

Connected to:
Oracle Database 21c Enterprise Edition Release 21.0.0.0.0 - Production
Version 21.3.0.0.0

SQL> SHUTDOWN IMMEDIATE;
Database closed.
Database dismounted.
ORACLE instance shut down.