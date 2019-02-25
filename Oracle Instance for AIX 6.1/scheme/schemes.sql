----DROP USER FLOWUSER CASCADE;

CREATE USER FLOWUSER
  IDENTIFIED BY <password>
  DEFAULT TABLESPACE USERS
  TEMPORARY TABLESPACE TEMP
  PROFILE DEFAULT
  ACCOUNT UNLOCK;
  -- 1 Role for FLOWUSER 
  GRANT DEV TO FLOWUSER;
  ALTER USER FLOWUSER DEFAULT ROLE NONE;
  -- 3 System Privileges for FLOWUSER 
  GRANT CREATE SESSION TO FLOWUSER;
  GRANT CREATE SYNONYM TO FLOWUSER;
  GRANT FORCE ANY TRANSACTION TO FLOWUSER;
  -- 1 Tablespace Quota for FLOWUSER 
  ALTER USER FLOWUSER QUOTA UNLIMITED ON IBATBS;
  -- 3 Object Privileges for FLOWUSER 
    GRANT EXECUTE, DEBUG ON IBAMVP.PKG_TRAFFIC TO FLOWUSER;
    GRANT EXECUTE, DEBUG ON MIGRATION_TARGET.PKG_TRAFFIC TO FLOWUSER;
    GRANT READ, WRITE ON DIRECTORY RADTRAFFIC TO FLOWUSER;


----DROP USER IBADEV CASCADE;

CREATE USER IBADEV
  IDENTIFIED BY <password>
  DEFAULT TABLESPACE IBATBS
  TEMPORARY TABLESPACE TEMP
  PROFILE DEFAULT
  ACCOUNT UNLOCK;
  -- 1 Role for IBADEV 
  GRANT DEV TO IBADEV;
  ALTER USER IBADEV DEFAULT ROLE ALL;
  -- 4 System Privileges for IBADEV 
  GRANT CREATE SESSION TO IBADEV;
  GRANT CREATE SYNONYM TO IBADEV;
  GRANT CREATE TYPE TO IBADEV;
  GRANT FORCE ANY TRANSACTION TO IBADEV;
  -- 2 Tablespace Quotas for IBADEV 
  ALTER USER IBADEV QUOTA UNLIMITED ON IBAIDX;
  ALTER USER IBADEV QUOTA UNLIMITED ON IBATBS;

DROP USER IBAMTIS CASCADE;

CREATE USER IBAMTIS
  IDENTIFIED BY <password>
  DEFAULT TABLESPACE IBATBS
  TEMPORARY TABLESPACE TEMP
  PROFILE DEFAULT
  ACCOUNT UNLOCK;
  -- 1 Role for IBAMTIS 
  GRANT CONNECT TO IBAMTIS;
  ALTER USER IBAMTIS DEFAULT ROLE ALL;
  -- 9 System Privileges for IBAMTIS 
  GRANT CREATE PROCEDURE TO IBAMTIS;
  GRANT CREATE PUBLIC SYNONYM TO IBAMTIS;
  GRANT CREATE SEQUENCE TO IBAMTIS;
  GRANT CREATE SESSION TO IBAMTIS;
  GRANT CREATE SYNONYM TO IBAMTIS;
  GRANT CREATE TABLE TO IBAMTIS;
  GRANT CREATE TRIGGER TO IBAMTIS;
  GRANT CREATE TYPE TO IBAMTIS;
  GRANT CREATE VIEW TO IBAMTIS;
  -- 1 Tablespace Quota for IBAMTIS 
  ALTER USER IBAMTIS QUOTA UNLIMITED ON IBATBS;
  


-----DROP USER IBAMVP CASCADE;

CREATE USER IBAMVP
  IDENTIFIED BY <password>
  DEFAULT TABLESPACE IBATBS
  TEMPORARY TABLESPACE IBATMP
  PROFILE DEFAULT
  ACCOUNT UNLOCK;
  -- 2 Roles for IBAMVP 
  GRANT CONNECT TO IBAMVP;
  GRANT XDBADMIN TO IBAMVP;
  ALTER USER IBAMVP DEFAULT ROLE ALL;
  -- 31 System Privileges for IBAMVP 
  GRANT ALTER SESSION TO IBAMVP;
  GRANT AUDIT ANY TO IBAMVP;
  GRANT AUDIT SYSTEM TO IBAMVP;
  GRANT CREATE ANY CONTEXT TO IBAMVP;
  GRANT CREATE ANY DIRECTORY TO IBAMVP;
  GRANT CREATE ANY MATERIALIZED VIEW TO IBAMVP;
  GRANT CREATE ANY SYNONYM TO IBAMVP;
  GRANT CREATE ANY TABLE TO IBAMVP;
  GRANT CREATE ANY VIEW TO IBAMVP;
  GRANT CREATE DATABASE LINK TO IBAMVP;
  GRANT CREATE JOB TO IBAMVP;
  GRANT CREATE MATERIALIZED VIEW TO IBAMVP;
  GRANT CREATE PROCEDURE TO IBAMVP;
  GRANT CREATE PUBLIC SYNONYM TO IBAMVP;
  GRANT CREATE SEQUENCE TO IBAMVP;
  GRANT CREATE SESSION TO IBAMVP;
  GRANT CREATE SYNONYM TO IBAMVP;
  GRANT CREATE TABLE TO IBAMVP;
  GRANT CREATE TRIGGER TO IBAMVP;
  GRANT CREATE TYPE TO IBAMVP;
  GRANT CREATE VIEW TO IBAMVP;
  GRANT DEBUG ANY PROCEDURE TO IBAMVP;
  GRANT DEBUG CONNECT SESSION TO IBAMVP;
  GRANT DROP PUBLIC SYNONYM TO IBAMVP;
  GRANT EXECUTE ANY PROGRAM TO IBAMVP;
  GRANT FORCE ANY TRANSACTION TO IBAMVP;
  GRANT GLOBAL QUERY REWRITE TO IBAMVP;
  GRANT SELECT ANY DICTIONARY TO IBAMVP;
  GRANT SELECT ANY TABLE TO IBAMVP;
  GRANT SELECT ANY TRANSACTION TO IBAMVP;
  GRANT UPDATE ANY TABLE TO IBAMVP;
  -- 3 Tablespace Quotas for IBAMVP 
  ALTER USER IBAMVP QUOTA UNLIMITED ON IBAIDX;
  ALTER USER IBAMVP QUOTA UNLIMITED ON IBATBS;
  ALTER USER IBAMVP QUOTA UNLIMITED ON MIGRATIONTBS;
  

----DROP USER IBAQA CASCADE;

CREATE USER IBAQA
  IDENTIFIED BY <password>
  DEFAULT TABLESPACE IBATBS
  TEMPORARY TABLESPACE TEMP
  PROFILE DEFAULT
  ACCOUNT UNLOCK;
  -- 1 Role for IBAQA 
  GRANT CONNECT TO IBAQA;
  ALTER USER IBAQA DEFAULT ROLE ALL;
  -- 2 System Privileges for IBAQA 
  GRANT CREATE SESSION TO IBAQA;
  GRANT CREATE VIEW TO IBAQA;
  -- 1 Tablespace Quota for IBAQA 
  ALTER USER IBAQA QUOTA UNLIMITED ON IBATBS;
  -- 514 Object Privileges for IBAQA 
    GRANT SELECT ON IBAMVP.ACCOUNTS TO IBAQA;
    GRANT SELECT ON IBAMVP.ACCOUNTS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.ACC_CREDIT_LIMIT TO IBAQA;
    GRANT SELECT ON IBAMVP.ACTIV_TYPE_BASE_UNIT_FEE TO IBAQA;
    GRANT SELECT ON IBAMVP.ADDRESS_HOUSES TO IBAQA;
    GRANT SELECT ON IBAMVP.ADDRESS_HOUSES_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.ADDRESS_HOUSES_TO_TP TO IBAQA;
    GRANT SELECT ON IBAMVP.ADDRESS_ROOMS TO IBAQA;
    GRANT SELECT ON IBAMVP.ADDRESS_ROOMS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.ADDRESS_STATUSES TO IBAQA;
    GRANT SELECT ON IBAMVP.ADDRESS_STREETS TO IBAQA;
    GRANT SELECT ON IBAMVP.ADDRESS_STREETS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.ADDR_ROOM_TYPES TO IBAQA;
    GRANT SELECT ON IBAMVP.ADDR_ROOM_TYPES_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.ADDR_STREET_TYPES TO IBAQA;
    GRANT SELECT ON IBAMVP.ADDR_STREET_TYPES_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.ARREARS TO IBAQA;
    GRANT SELECT ON IBAMVP.ARREARS_DOCS TO IBAQA;
    GRANT SELECT ON IBAMVP.ARREARS_DOCS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.ARREARS_DOC_ACTIV_TYPES TO IBAQA;
    GRANT SELECT ON IBAMVP.ARREARS_DOC_CONTRACTS TO IBAQA;
    GRANT SELECT ON IBAMVP.BANKS TO IBAQA;
    GRANT SELECT ON IBAMVP.BANKS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.BANK_ACCOUNTS TO IBAQA;
    GRANT SELECT ON IBAMVP.BANK_ACCOUNTS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.BANK_ACCS_TO_RETURN TO IBAQA;
    GRANT SELECT ON IBAMVP.BANK_ACCS_TO_RETURN_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.BANK_STATEMENT TO IBAQA;
    GRANT SELECT ON IBAMVP.BONUSES TO IBAQA;
    GRANT SELECT ON IBAMVP.BONUSES_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.BONUS_ACC_TRANSF_CONFIG TO IBAQA;
    GRANT SELECT ON IBAMVP.BONUS_ACC_TRANSF_CONFIG_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.BONUS_GROUPS TO IBAQA;
    GRANT SELECT ON IBAMVP.BONUS_GROUPS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.BONUS_GROUP_ACCS TO IBAQA;
    GRANT SELECT ON IBAMVP.BONUS_GROUP_ACCS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.BONUS_GROUP_MAIN_ACC TO IBAQA;
    GRANT SELECT ON IBAMVP.BONUS_SERV_VOLUME TO IBAQA;
    GRANT SELECT ON IBAMVP.BONUS_SERV_VOLUME_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.BONUS_STATUSES TO IBAQA;
    GRANT SELECT ON IBAMVP.BONUS_STATUSES_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.BONUS_VERSIONS TO IBAQA;
    GRANT SELECT ON IBAMVP.BONUS_VERSIONS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.BROKERS TO IBAQA;
    GRANT SELECT ON IBAMVP.BROKERS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.BROKER_CONTRACTS TO IBAQA;
    GRANT SELECT ON IBAMVP.BROKER_CONTRACTS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.BROKER_ROOMS TO IBAQA;
    GRANT SELECT ON IBAMVP.BROKER_ROOMS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.BROKER_STATUSES TO IBAQA;
    GRANT SELECT ON IBAMVP.BROKER_STATUSES_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.BROKER_VATS TO IBAQA;
    GRANT SELECT ON IBAMVP.BROKER_VATS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.CONFIG_PARAMS TO IBAQA;
    GRANT SELECT ON IBAMVP.CONFIG_PARAMS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.CONFIG_PARAMS_READONLY_MV TO IBAQA;
    GRANT SELECT ON IBAMVP.CONTRACTS TO IBAQA;
    GRANT SELECT ON IBAMVP.CONTRACTS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.CONTRACT_BREAK TO IBAQA;
    GRANT SELECT ON IBAMVP.CONTRACT_GROUP_OPERS TO IBAQA;
    GRANT SELECT ON IBAMVP.CONTRACT_GROUP_OPERS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.CONTRACT_OPERS TO IBAQA;
    GRANT SELECT ON IBAMVP.CONTRACT_OPERS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.CONTRACT_TPS TO IBAQA;
    GRANT SELECT ON IBAMVP.CONTRACT_TPS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.CONTRACT_TPS_OPER TO IBAQA;
    GRANT SELECT ON IBAMVP.CONTRACT_TPS_OPER_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.CONTRACT_TPS_TECH_SPEC TO IBAQA;
    GRANT SELECT ON IBAMVP.CONTR_TO_BROKER_ACCS TO IBAQA;
    GRANT SELECT ON IBAMVP.COUNTRIES TO IBAQA;
    GRANT SELECT ON IBAMVP.COUNTRIES_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.CURRENCY TO IBAQA;
    GRANT SELECT ON IBAMVP.CURRENCY_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.CURRENCY_RATES TO IBAQA;
    GRANT SELECT ON IBAMVP.CURRENCY_RATES_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.DEPARTMENTS TO IBAQA;
    GRANT SELECT ON IBAMVP.DEPARTMENTS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.DESCRIPTION_TABLES TO IBAQA;
    GRANT SELECT ON IBAMVP.DICT TO IBAQA;
    GRANT SELECT ON IBAMVP.DICT_CONDITION_MV TO IBAQA;
    GRANT SELECT ON IBAMVP.DICT_DISCOUNT_TYPES TO IBAQA;
    GRANT SELECT ON IBAMVP.DICT_MV TO IBAQA;
    GRANT SELECT ON IBAMVP.DICT_NAMES_MV TO IBAQA;
    GRANT SELECT ON IBAMVP.DICT_SIMPLE TO IBAQA;
    GRANT SELECT ON IBAMVP.DICT_SIMPLE_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.DISCOUNTS TO IBAQA;
    GRANT SELECT ON IBAMVP.DISCOUNTS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.DISCOUNT_ADDRESS TO IBAQA;
    GRANT SELECT ON IBAMVP.DISCOUNT_ADDRESS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.DISCOUNT_INTERACT TO IBAQA;
    GRANT SELECT ON IBAMVP.DISCOUNT_INTERACT_FILTER TO IBAQA;
    GRANT SELECT ON IBAMVP.DISCOUNT_INTERACT_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.DISCOUNT_STATUSES TO IBAQA;
    GRANT SELECT ON IBAMVP.DISCOUNT_STATUSES_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.DISCOUNT_TP TO IBAQA;
    GRANT SELECT ON IBAMVP.DISCOUNT_TP_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.DISCOUNT_VERSIONS TO IBAQA;
    GRANT SELECT ON IBAMVP.DISCOUNT_VERSIONS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.DISC_SUBSCR_SUBGROUPS TO IBAQA;
    GRANT SELECT ON IBAMVP.DISC_SUBSCR_SUBGROUPS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.DIS_TSC TO IBAQA;
    GRANT SELECT ON IBAMVP.DIS_TSC_ARRAY_BURDEN TO IBAQA;
    GRANT SELECT ON IBAMVP.DIS_TSC_ARRAY_DISCOUNT TO IBAQA;
    GRANT SELECT ON IBAMVP.DIS_TSC_VERSION TO IBAQA;
    GRANT SELECT ON IBAMVP.EMPLOYEES TO IBAQA;
    GRANT SELECT ON IBAMVP.EMPLOYEES_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.ERIP_202 TO IBAQA;
    GRANT SELECT ON IBAMVP.ERIP_202_204_ROWS TO IBAQA;
    GRANT SELECT ON IBAMVP.ERIP_202_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.ERIP_210 TO IBAQA;
    GRANT SELECT ON IBAMVP.ERIP_210_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.ERIP_LOG TO IBAQA;
    GRANT SELECT ON IBAMVP.ERIP_MESSAGE_LOG TO IBAQA;
    GRANT SELECT ON IBAMVP.ERIP_OPERS TO IBAQA;
    GRANT SELECT ON IBAMVP.ERIP_OPERS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.FORMATION_DOCS TO IBAQA;
    GRANT SELECT ON IBAMVP.FORMATION_DOCS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.FORM_DOCS_B_PROCESSES TO IBAQA;
    GRANT SELECT ON IBAMVP.FORM_DOCS_B_PROCESSES_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.GOODS TO IBAQA;
    GRANT SELECT ON IBAMVP.GOODS_DEPRECIATION TO IBAQA;
    GRANT SELECT ON IBAMVP.GOODS_GROUPS TO IBAQA;
    GRANT SELECT ON IBAMVP.GOODS_GROUPS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.GOODS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.GOODS_MANUFACTURERS TO IBAQA;
    GRANT SELECT ON IBAMVP.GOODS_MANUFACTURERS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.GOODS_MODELS TO IBAQA;
    GRANT SELECT ON IBAMVP.GOODS_MODELS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.GOODS_OPERS TO IBAQA;
    GRANT SELECT ON IBAMVP.GOODS_PACKS TO IBAQA;
    GRANT SELECT ON IBAMVP.GOODS_TO_GOODS_OPERS TO IBAQA;
    GRANT SELECT ON IBAMVP.GO_TO_GS_MV TO IBAQA;
    GRANT SELECT ON IBAMVP.HANDLING TO IBAQA;
    GRANT SELECT ON IBAMVP.HANDLING_CATEGORY TO IBAQA;
    GRANT SELECT ON IBAMVP.HANDLING_FLOW TO IBAQA;
    GRANT SELECT ON IBAMVP.HANDLING_REASON TO IBAQA;
    GRANT SELECT ON IBAMVP.HANDLING_WAY TO IBAQA;
    GRANT SELECT ON IBAMVP.IBAMVP_COL_COMMENTS_MW TO IBAQA;
    GRANT SELECT ON IBAMVP.MD_APPLICATIONS TO IBAQA;
    GRANT SELECT ON IBAMVP.MTIS_USER TO IBAQA;
    GRANT SELECT ON IBAMVP.MTIS_USERS TO IBAQA;
    GRANT SELECT ON IBAMVP.MTIS_USER_BUNCH TO IBAQA;
    GRANT SELECT ON IBAMVP.MTIS_USER_GROUP TO IBAQA;
    GRANT SELECT ON IBAMVP.MTIS_USER_GROUP_LINK TO IBAQA;
    GRANT SELECT ON IBAMVP.MTIS_USER_PAGE TO IBAQA;
    GRANT SELECT ON IBAMVP.MTIS_USER_ROLE TO IBAQA;
    GRANT SELECT ON IBAMVP.MTIS_USER_ROLE_MS TO IBAQA;
    GRANT EXECUTE ON IBAMVP.NUMBER_ARRAY_NT TO IBAQA;
    GRANT SELECT ON IBAMVP.OPERATIONS TO IBAQA;
    GRANT SELECT ON IBAMVP.OPERATOR_PROP TO IBAQA;
    GRANT SELECT ON IBAMVP.OPERATOR_PROP_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.OPER_NAMES_CASHBOX_MV TO IBAQA;
    GRANT SELECT ON IBAMVP.OPER_NAMES_CONST_MV TO IBAQA;
    GRANT SELECT ON IBAMVP.OPER_NAMES_SINGLE TO IBAQA;
    GRANT SELECT ON IBAMVP.OPER_NAMES_SINGLE_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.OPER_NAMES_SINGLE_L TO IBAQA;
    GRANT SELECT ON IBAMVP.OPER_NAMES_SINGLE_L_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.OPER_NAME_CONST_LINKS_MV TO IBAQA;
    GRANT SELECT ON IBAMVP.OPER_PARAMS_PP TO IBAQA;
    GRANT SELECT ON IBAMVP.OPER_ROUND_TYPES TO IBAQA;
    GRANT SELECT ON IBAMVP.OPER_TRANSFERS TO IBAQA;
    GRANT SELECT ON IBAMVP.PACKAGE_BACKUPS TO IBAQA;
    GRANT SELECT ON IBAMVP.PEERING_NETPOOL TO IBAQA;
    GRANT SELECT ON IBAMVP.PKG_DICT_SET_STATUS TO IBAQA;
    GRANT SELECT ON IBAMVP.PP_AVAIL_AMOUNTS TO IBAQA;
    GRANT SELECT ON IBAMVP.PP_AVAIL_AMOUNTS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.PREPAY_BILLS TO IBAQA;
    GRANT SELECT ON IBAMVP.PRS_GROUPS TO IBAQA;
    GRANT SELECT ON IBAMVP.PRS_GROUPS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.PRS_GROUP_EMPLOYEES TO IBAQA;
    GRANT SELECT ON IBAMVP.PRS_GROUP_EMPLOYEES_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.RECENT_PAYMENT_ACCS TO IBAQA;
    GRANT SELECT ON IBAMVP.REQUESTS TO IBAQA;
    GRANT SELECT ON IBAMVP.REQ_DEPARTMENTS TO IBAQA;
    GRANT SELECT ON IBAMVP.REQ_DEPARTMENTS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.REQ_DEP_ADDRESS TO IBAQA;
    GRANT SELECT ON IBAMVP.REQ_DEP_ADDRESS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.RESTS TO IBAQA;
    GRANT SELECT ON IBAMVP.RESTS_BROKER TO IBAQA;
    GRANT SELECT ON IBAMVP.RESTS_LOG TO IBAQA;
    GRANT SELECT ON IBAMVP.ROOM_ATV_STATUSES TO IBAQA;
    GRANT SELECT ON IBAMVP.ROOM_ATV_STATUSES_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.ROUNDING TO IBAQA;
    GRANT SELECT ON IBAMVP.ROUNDING_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.ROUNDING_KEYS_MV TO IBAQA;
    GRANT SELECT ON IBAMVP.SHIPPING_LISTS TO IBAQA;
    GRANT SELECT ON IBAMVP.SORM TO IBAQA;
    GRANT SELECT ON IBAMVP.STATIONS TO IBAQA;
    GRANT SELECT ON IBAMVP.STATIONS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.STATION_ACT_SUB_TYPES TO IBAQA;
    GRANT SELECT ON IBAMVP.STATION_ACT_SUB_TYPES_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.STATION_ATV_CHANNELS TO IBAQA;
    GRANT SELECT ON IBAMVP.STATION_ATV_CHANNELS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.SUBSCRIBERS TO IBAQA;
    GRANT SELECT ON IBAMVP.SUBSCRIBERS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.SUBSCR_CONTACT_ENT TO IBAQA;
    GRANT SELECT ON IBAMVP.SUBSCR_CONTACT_ENT_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.SUBSCR_GROUPS TO IBAQA;
    GRANT SELECT ON IBAMVP.SUBSCR_GROUPS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.SUBSCR_PHOTO TO IBAQA;
    GRANT SELECT ON IBAMVP.SUBSCR_PHOTO_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.SUBSCR_TO_GROUPS TO IBAQA;
    GRANT SELECT ON IBAMVP.SUBSCR_TO_GROUPS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.SUPPLY TO IBAQA;
    GRANT SELECT ON IBAMVP.SUPPLY_MEASURE TO IBAQA;
    GRANT SELECT ON IBAMVP.SWITCHES TO IBAQA;
    GRANT SELECT ON IBAMVP.SWITCHES_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.SYS_LOG TO IBAQA;
    GRANT SELECT ON IBAMVP.TARIFF_PLANS TO IBAQA;
    GRANT SELECT ON IBAMVP.TARIFF_PLANS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.TEST20181222 TO IBAQA;
    GRANT SELECT ON IBAMVP.TEST_20181214 TO IBAQA;
    GRANT SELECT ON IBAMVP.TMP_EMPLOYEE_SHORT_LIST TO IBAQA;
    GRANT SELECT ON IBAMVP.TMP_EMPLOYEE_SHORT_LIST_EXT TO IBAQA;
    GRANT SELECT ON IBAMVP.TMP_PAGE_QUANTITY TO IBAQA;
    GRANT SELECT ON IBAMVP.TMP_PROJECTIONS TO IBAQA;
    GRANT SELECT ON IBAMVP.TMP_P_LOG TO IBAQA;
    GRANT SELECT ON IBAMVP.TOAD_PLAN_TABLE TO IBAQA;
    GRANT SELECT ON IBAMVP.TPS_PAID_BY_BONUS TO IBAQA;
    GRANT SELECT ON IBAMVP.TPS_PAID_BY_BONUS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.TP_ADDRESS TO IBAQA;
    GRANT SELECT ON IBAMVP.TP_ADDRESS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.TP_CHANGE_COST TO IBAQA;
    GRANT SELECT ON IBAMVP.TP_CHANGE_COST_DEF TO IBAQA;
    GRANT SELECT ON IBAMVP.TP_CHANGE_COST_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.TP_CHANGE_COST_TPS TO IBAQA;
    GRANT SELECT ON IBAMVP.TP_COMPLEX TO IBAQA;
    GRANT SELECT ON IBAMVP.TP_COMPLEX_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.TP_EXTRA_SERV_CONFIG TO IBAQA;
    GRANT SELECT ON IBAMVP.TP_EXTRA_SERV_CONFIG_VERSIONS TO IBAQA;
    GRANT SELECT ON IBAMVP.TP_GOODS_MODELS TO IBAQA;
    GRANT SELECT ON IBAMVP.TP_GOODS_MODELS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.TP_GOODS_PACKS TO IBAQA;
    GRANT SELECT ON IBAMVP.TP_GOODS_PACKS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.TP_INTERACT TO IBAQA;
    GRANT SELECT ON IBAMVP.TP_INTERACT_VERSIONS TO IBAQA;
    GRANT SELECT ON IBAMVP.TP_INTERVALS TO IBAQA;
    GRANT SELECT ON IBAMVP.TP_INTERVALS_CL TO IBAQA;
    GRANT SELECT ON IBAMVP.TP_INTERVALS_CL_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.TP_INTERVALS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.TP_STATUSES TO IBAQA;
    GRANT SELECT ON IBAMVP.TP_STATUSES_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.TP_SUBSCR_SUBGROUPS TO IBAQA;
    GRANT SELECT ON IBAMVP.TP_SUBSCR_SUBGROUPS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.TP_TV_PACKETS TO IBAQA;
    GRANT SELECT ON IBAMVP.TP_TV_PACKETS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.TP_TV_PACKET_CHANNELS TO IBAQA;
    GRANT SELECT ON IBAMVP.TP_TV_PACKET_CHANNELS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.TP_VERSIONS TO IBAQA;
    GRANT SELECT ON IBAMVP.TP_VERSIONS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.TV TO IBAQA;
    GRANT SELECT ON IBAMVP.TV_DEFECTS TO IBAQA;
    GRANT SELECT ON IBAMVP.TV_DEFECTS_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.TV_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.TV_STATUSES TO IBAQA;
    GRANT SELECT ON IBAMVP.TV_STATUSES_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.TYCHKOU_TEST_DI TO IBAQA;
    GRANT SELECT ON IBAMVP.TYCHKOU_TEST_DI_SERVICE TO IBAQA;
    GRANT SELECT ON IBAMVP.VAT_RATES TO IBAQA;
    GRANT SELECT ON IBAMVP.VAT_RATES_HIST TO IBAQA;
    GRANT SELECT ON IBAMVP.VAT_RATE_DEFAULT_HIST TO IBAQA;
