/******************************************************************************/
/*            Generated by IBExpert 2018.8.3.1 22.10.2018 10:26:55            */
/******************************************************************************/

SET SQL DIALECT 3;

SET NAMES UTF8;

SET CLIENTLIB 'C:\Program Files\Firebird\Firebird_2_5\WOW64\fbclient.dll';

CONNECT 'localhost/3050:C:\Users\user\Documents\topaz\analytics\project\Win32\Debug\db\SHRFS.FDB' USER 'SYSDBA';



/******************************************************************************/
/*                                 Generators                                 */
/******************************************************************************/

CREATE GENERATOR GEN_ACTIONLOG_ID;
CREATE GENERATOR GEN_CASHFLOW_ID;
CREATE GENERATOR GEN_CONTRACTS_ID;
CREATE GENERATOR GEN_HOSES_ID;
CREATE GENERATOR GEN_INCOMESBYDISCHARGE_ID;
CREATE GENERATOR GEN_INOUTGSM_ID;
CREATE GENERATOR GEN_INPUTGSM_ID;
CREATE GENERATOR GEN_IOTANKSHOSES_ID;
CREATE GENERATOR GEN_ITEMOUTCOMESBYRETAIL_ID;
CREATE GENERATOR GEN_ITEMRESTS_ID;
CREATE GENERATOR GEN_ORDERS_ID;
CREATE GENERATOR GEN_OUTCOMESBYCOUPON_ID;
CREATE GENERATOR GEN_OUTCOMESBYOFFICE_ID;
CREATE GENERATOR GEN_OUTCOMESBYRETAIL_ID;
CREATE GENERATOR GEN_SESSIONS_ID;
CREATE GENERATOR GEN_TABLESLIST_ID;
CREATE GENERATOR GEN_TANKS_ID;
CREATE GENERATOR GEN_TDB_ITEMS_ID;
CREATE GENERATOR GEN_TECHRETURN_ID;
CREATE GENERATOR GEN_TRADEDOCSINBILL_ID;
CREATE GENERATOR GEN_USEROPTIONS_ID;
CREATE GENERATOR GEN_USERS_ID;
CREATE GENERATOR INOUTGSM;


/******************************************************************************/
/*                             Stored procedures                              */
/******************************************************************************/



SET TERM ^ ;

CREATE OR ALTER PROCEDURE CALCINCOMES (
    SESSION_ID INTEGER NOT NULL,
    TANKNUM VARCHAR(10) CHARACTER SET UTF8 NOT NULL COLLATE UTF8)
RETURNS (
    VOLUME DOUBLE PRECISION NOT NULL)
AS
BEGIN
  SUSPEND;
END^





CREATE OR ALTER PROCEDURE CALCOUTCOMES (
    SESSION_ID INTEGER NOT NULL,
    TANKNUM VARCHAR(10) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    HOSENUM INTEGER NOT NULL)
RETURNS (
    VOLUME DOUBLE PRECISION NOT NULL)
AS
BEGIN
  SUSPEND;
END^





CREATE OR ALTER PROCEDURE RESTOREIOTHREC (
    SESSION_ID INTEGER NOT NULL,
    AZSCODE VARCHAR(10) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    TANKNUM VARCHAR(10) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    HOSENUM INTEGER NOT NULL)
AS
BEGIN
  EXIT;
END^






SET TERM ; ^



/******************************************************************************/
/*                                   Tables                                   */
/******************************************************************************/



CREATE TABLE ACTIONLOG (
    ID       INTEGER NOT NULL,
    ADATE    TIMESTAMP NOT NULL,
    USER_ID  INTEGER NOT NULL,
    MSG      VARCHAR(200) CHARACTER SET UTF8 COLLATE UTF8
);

CREATE TABLE CASHFLOW (
    ID           INTEGER NOT NULL,
    SESSION_ID   INTEGER NOT NULL,
    DOCTYPEID    INTEGER NOT NULL,
    DOCTYPENAME  VARCHAR(50) CHARACTER SET UTF8 COLLATE UTF8,
    CASHID       INTEGER NOT NULL,
    CASHNAME     VARCHAR(50) CHARACTER SET UTF8 COLLATE UTF8,
    REMARK       VARCHAR(10) CHARACTER SET UTF8 COLLATE UTF8,
    AMOUNT       DOUBLE PRECISION NOT NULL
);

CREATE TABLE CONTRACTS (
    ID            INTEGER NOT NULL,
    NOMER         VARCHAR(128) CHARACTER SET UTF8 COLLATE UTF8,
    PARTNER_CODE  VARCHAR(12) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    NAME          VARCHAR(100) CHARACTER SET UTF8 COLLATE UTF8
);

CREATE TABLE CONTRAGENTS (
    CODE  VARCHAR(12) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    NAME  VARCHAR(100) CHARACTER SET UTF8 COLLATE UTF8
);

CREATE TABLE FIRMS (
    CODE  VARCHAR(10) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    NAME  VARCHAR(50) CHARACTER SET UTF8 NOT NULL COLLATE UTF8
);

CREATE TABLE HOSES (
    ID            SMALLINT NOT NULL,
    SESSION_ID    INTEGER NOT NULL,
    HOSENUM       INTEGER NOT NULL,
    STARTCOUNTER  DOUBLE PRECISION NOT NULL,
    ENDCOUNTER    DOUBLE PRECISION NOT NULL,
    PUMPNUM       INTEGER NOT NULL,
    NUMINPUMP     INTEGER NOT NULL,
    HOSETYPE      VARCHAR(16) CHARACTER SET UTF8 COLLATE UTF8,
    TANKNUM       VARCHAR(10) CHARACTER SET UTF8 COLLATE UTF8
);

CREATE TABLE INCOMESBYDISCHARGE (
    ID              INTEGER NOT NULL,
    SESSION_ID      INTEGER NOT NULL,
    ODT             TIMESTAMP NOT NULL,
    DOCNUMBER       VARCHAR(12) CHARACTER SET UTF8 COLLATE UTF8,
    DOCCARNUMBER    VARCHAR(10) CHARACTER SET UTF8 COLLATE UTF8,
    TANKNUM         VARCHAR(10) CHARACTER SET UTF8 COLLATE UTF8,
    FUELNAME        VARCHAR(100) CHARACTER SET UTF8 COLLATE UTF8,
    FUELEXTCODE     VARCHAR(11) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    DENSITY         DOUBLE PRECISION NOT NULL,
    MASS            DOUBLE PRECISION NOT NULL,
    VOLUME          DOUBLE PRECISION NOT NULL,
    DISCREPANCY     DOUBLE PRECISION,
    PRICE           DOUBLE PRECISION,
    DOCTEMPERATURE  DOUBLE PRECISION,
    PARTNERNAME     VARCHAR(50) CHARACTER SET UTF8 COLLATE UTF8,
    PARTNEREXTCODE  VARCHAR(12) CHARACTER SET UTF8 NOT NULL COLLATE UTF8
);

CREATE TABLE INOUTGSM (
    ID            INTEGER NOT NULL,
    SESSION_ID    INTEGER NOT NULL,
    TBL           VARCHAR(3) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    DIRECTION     INTEGER NOT NULL,
    CLIENT_CODE   VARCHAR(12) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    CONTRACT_ID   INTEGER NOT NULL,
    PAYMENT_CODE  VARCHAR(10) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    WARE_CODE     VARCHAR(11) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    AMOUNT        DOUBLE PRECISION NOT NULL,
    EI            VARCHAR(10) CHARACTER SET UTF8 COLLATE UTF8,
    VOLUME        DOUBLE PRECISION NOT NULL,
    DENSITY       DOUBLE PRECISION NOT NULL,
    PRICE         DOUBLE PRECISION NOT NULL,
    SUMM          DOUBLE PRECISION NOT NULL,
    NDS           VARCHAR(10) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    WHOLE         DOUBLE PRECISION NOT NULL,
    LASTUSER_ID   INTEGER NOT NULL,
    UPDATED_AT    TIMESTAMP NOT NULL,
    STATE         INTEGER DEFAULT 0 NOT NULL,
    AZSCODE       VARCHAR(10) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    TANKNUM       VARCHAR(10) CHARACTER SET UTF8 NOT NULL COLLATE UTF8
);

CREATE TABLE IOTANKSHOSES (
    ID               INTEGER NOT NULL,
    SESSION_ID       INTEGER NOT NULL,
    TANKNUM          VARCHAR(10) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    STARTFUELVOLUME  DOUBLE PRECISION NOT NULL,
    ENDFACTVOLUME    DOUBLE PRECISION NOT NULL,
    DENSITY          DOUBLE PRECISION NOT NULL,
    TEMPERATURE      DOUBLE PRECISION NOT NULL,
    HEIGHT           DOUBLE PRECISION NOT NULL,
    MASS             DOUBLE PRECISION NOT NULL,
    WATER            DOUBLE PRECISION NOT NULL,
    DEADREST         DOUBLE PRECISION NOT NULL,
    DEADRESTLITER    DOUBLE PRECISION NOT NULL,
    WARECODE         VARCHAR(11) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    HOSENUM          INTEGER NOT NULL,
    STARTCOUNTER     DOUBLE PRECISION NOT NULL,
    ENDCOUNTER       DOUBLE PRECISION NOT NULL,
    PUMPNUM          INTEGER,
    NUMINPUMP        INTEGER,
    HOSETYPE         VARCHAR(16) CHARACTER SET UTF8 COLLATE UTF8,
    LASTUSER_ID      INTEGER NOT NULL,
    UPDATED_AT       TIMESTAMP NOT NULL,
    STATE            INTEGER DEFAULT 0 NOT NULL,
    AZSCODE          VARCHAR(10) CHARACTER SET UTF8 NOT NULL COLLATE UTF8
);

CREATE TABLE ITEMOUTCOMESBYRETAIL (
    ID                  INTEGER NOT NULL,
    SESSION_ID          INTEGER NOT NULL,
    ITEMNAME            VARCHAR(100) CHARACTER SET UTF8 COLLATE UTF8,
    ITEMEXTCODE         VARCHAR(16) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    ITEMGROUP           VARCHAR(20) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    ITEMGRPEXTCODE      VARCHAR(16) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    ISSERVICE           SMALLINT DEFAULT 0 NOT NULL,
    PAYMENTMODENAME     VARCHAR(50) CHARACTER SET UTF8 COLLATE UTF8,
    PAYMENTMODEEXTCODE  VARCHAR(10) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    PARTNERNAME         VARCHAR(100) CHARACTER SET UTF8 COLLATE UTF8,
    PARTNEREXTCODE      VARCHAR(12) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    PARTNERINN          VARCHAR(20) CHARACTER SET UTF8 COLLATE UTF8,
    ITEMID              INTEGER NOT NULL,
    NDS                 VARCHAR(10) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    UNIT                VARCHAR(10) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    FRDEPARTMENT        VARCHAR(50) CHARACTER SET UTF8 COLLATE UTF8,
    "HASH"              VARCHAR(48) CHARACTER SET UTF8 COLLATE UTF8,
    ITEMCODE            VARCHAR(16) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    ISRETURN            SMALLINT DEFAULT 0 NOT NULL,
    QUANTITY            INTEGER NOT NULL,
    AMOUNT              DOUBLE PRECISION NOT NULL,
    PRICEFASTTRADE      DOUBLE PRECISION NOT NULL,
    PRICEIN             DOUBLE PRECISION NOT NULL,
    PRICERETAIL         DOUBLE PRECISION NOT NULL
);

CREATE TABLE ITEMRESTS (
    ID              INTEGER NOT NULL,
    SESSION_ID      INTEGER NOT NULL,
    ITEMREST        INTEGER NOT NULL,
    STORAGEEXTCODE  VARCHAR(10) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    STORAGENAME     VARCHAR(50) CHARACTER SET UTF8 COLLATE UTF8,
    ITEMEXTCODE     VARCHAR(16) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    ITEMNAME        VARCHAR(100) CHARACTER SET UTF8 COLLATE UTF8,
    ITEMCODE        VARCHAR(16) CHARACTER SET UTF8 NOT NULL COLLATE UTF8
);

CREATE TABLE ITEMS (
    CODE   VARCHAR(16) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    NAME   VARCHAR(100) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    ICODE  VARCHAR(16) CHARACTER SET UTF8 COLLATE UTF8
);

CREATE TABLE ORDERS (
    ID          INTEGER NOT NULL,
    AZSCODE     VARCHAR(10) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    SESSION     INTEGER NOT NULL,
    ODT         TIMESTAMP NOT NULL,
    ORDERNUM    INTEGER NOT NULL,
    PUMPNUM     INTEGER NOT NULL,
    TANKSNUM    VARCHAR(10) CHARACTER SET UTF8 COLLATE UTF8,
    FUELPRICE   DOUBLE PRECISION NOT NULL,
    FUELVOLUME  DOUBLE PRECISION NOT NULL,
    FUELAMOUNT  DOUBLE PRECISION NOT NULL,
    FILENAME    VARCHAR(255) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    FUELEXCODE  VARCHAR(11) CHARACTER SET UTF8 COLLATE UTF8
);

CREATE TABLE OUTCOMESBYCOUPON (
    ID              INTEGER NOT NULL,
    SESSION_ID      INTEGER NOT NULL,
    ODT             TIMESTAMP NOT NULL,
    SESSIONID       INTEGER NOT NULL,
    DOCID           VARCHAR(16) CHARACTER SET UTF8 COLLATE UTF8,
    VOLUME          DOUBLE PRECISION NOT NULL,
    AMOUNT          DOUBLE PRECISION NOT NULL,
    COUPONCODE      VARCHAR(16) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    COUPONFUELNAME  VARCHAR(100) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    COUPONVOLUME    DOUBLE PRECISION NOT NULL,
    VOLUMEFACT      DOUBLE PRECISION NOT NULL,
    FUELEXTCODE     VARCHAR(11) CHARACTER SET UTF8 COLLATE UTF8
);

CREATE TABLE OUTCOMESBYOFFICE (
    ID                  INTEGER NOT NULL,
    SESSION_ID          INTEGER NOT NULL,
    ODT                 TIMESTAMP NOT NULL,
    TANKNUM             VARCHAR(10) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    HOSENAME            VARCHAR(10) CHARACTER SET UTF8 COLLATE UTF8,
    FUELNAME            VARCHAR(100) CHARACTER SET UTF8 COLLATE UTF8,
    FUELEXTCODE         VARCHAR(11) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    PAYMENTMODENAME     VARCHAR(50) CHARACTER SET UTF8 COLLATE UTF8,
    PAYMENTMODEEXTCODE  VARCHAR(10) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    REMARK              VARCHAR(10) CHARACTER SET UTF8 COLLATE UTF8,
    VOLUME              DOUBLE PRECISION NOT NULL,
    AMOUNT              DOUBLE PRECISION NOT NULL,
    MASS                DOUBLE PRECISION,
    ORIGPRICE           DOUBLE PRECISION NOT NULL,
    HASORDER            SMALLINT NOT NULL
);

CREATE TABLE OUTCOMESBYRETAIL (
    ID                  INTEGER NOT NULL,
    SESSION_ID          INTEGER NOT NULL,
    TANKNUM             VARCHAR(10) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    HOSENAME            VARCHAR(10) CHARACTER SET UTF8 COLLATE UTF8,
    FUELNAME            VARCHAR(100) CHARACTER SET UTF8 COLLATE UTF8,
    PAYMENTMODENAME     VARCHAR(50) CHARACTER SET UTF8 COLLATE UTF8,
    AGENTNAME           VARCHAR(50) CHARACTER SET UTF8 COLLATE UTF8,
    CARDCODE            VARCHAR(10) CHARACTER SET UTF8 COLLATE UTF8,
    PARTNERNAME         VARCHAR(50) CHARACTER SET UTF8 COLLATE UTF8,
    PARTNERINN          VARCHAR(20) CHARACTER SET UTF8 COLLATE UTF8,
    FUELEXTCODE         VARCHAR(11) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    PAYMENTMODEEXTCODE  VARCHAR(10) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    AGENTEXTCODE        VARCHAR(10) CHARACTER SET UTF8 COLLATE UTF8,
    PARTNEREXTCODE      VARCHAR(12) CHARACTER SET UTF8 COLLATE UTF8,
    VOLUME              DOUBLE PRECISION NOT NULL,
    AMOUNT              DOUBLE PRECISION NOT NULL,
    MASS                DOUBLE PRECISION,
    ORIGPRICE           DOUBLE PRECISION NOT NULL,
    REMARK              VARCHAR(10) CHARACTER SET UTF8 COLLATE UTF8,
    ORDERCOUNT          INTEGER
);

CREATE TABLE PAYMENTMODES (
    CODE  VARCHAR(10) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    NAME  VARCHAR(50) CHARACTER SET UTF8 COLLATE UTF8
);

CREATE TABLE SESSIONS (
    ID             INTEGER NOT NULL,
    AZSCODE        VARCHAR(10) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    SESSIONNUM     INTEGER NOT NULL,
    STARTDATETIME  TIMESTAMP NOT NULL,
    ENDDATETIME    TIMESTAMP NOT NULL,
    USERNAME       VARCHAR(50) CHARACTER SET UTF8 COLLATE UTF8
);

CREATE TABLE STATIONS (
    CODE     VARCHAR(10) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    NAME     VARCHAR(50) CHARACTER SET UTF8 COLLATE UTF8,
    EXTCODE  VARCHAR(10) CHARACTER SET UTF8 NOT NULL COLLATE UTF8
);

CREATE TABLE STORAGES (
    CODE  VARCHAR(10) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    NAME  VARCHAR(50) CHARACTER SET UTF8 COLLATE UTF8
);

CREATE TABLE TABLESLIST (
    ID         INTEGER NOT NULL,
    TABLENAME  VARCHAR(48) CHARACTER SET UTF8 NOT NULL COLLATE UTF8
);

CREATE TABLE TANKS (
    ID               SMALLINT NOT NULL,
    SESSION_ID       INTEGER NOT NULL,
    TANKNUM          VARCHAR(10) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    ENDDENSITY       DOUBLE PRECISION NOT NULL,
    STARTFUELVOLUME  DOUBLE PRECISION NOT NULL,
    ENDFACTVOLUME    DOUBLE PRECISION DEFAULT 0 NOT NULL,
    ENDTEMPERATURE   DOUBLE PRECISION DEFAULT 0 NOT NULL,
    ENDHEIGHT        DOUBLE PRECISION DEFAULT 0 NOT NULL,
    ENDMASS          DOUBLE PRECISION DEFAULT 0 NOT NULL,
    ENDWATER         DOUBLE PRECISION DEFAULT 0,
    DEADREST         DOUBLE PRECISION DEFAULT 0 NOT NULL,
    DEADRESTLITER    DOUBLE PRECISION DEFAULT 0 NOT NULL,
    WARECODE         VARCHAR(11) CHARACTER SET UTF8 COLLATE UTF8
);

CREATE TABLE TDB_ITEMS (
    ID             INTEGER NOT NULL,
    BILL_ID        INTEGER NOT NULL,
    ITEMNAME       VARCHAR(100) CHARACTER SET UTF8 COLLATE UTF8,
    ITEMEXTCODE    VARCHAR(16) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    ITEMISSERVICE  SMALLINT NOT NULL,
    ITEMCODE       VARCHAR(16) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    UNITNAME       VARCHAR(10) CHARACTER SET UTF8 COLLATE UTF8,
    UNITEXTCODE    VARCHAR(10) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    AMOUNT         DOUBLE PRECISION NOT NULL,
    QUANTITY       INTEGER NOT NULL,
    PRICE          DOUBLE PRECISION NOT NULL,
    NDSAMOUNT      DOUBLE PRECISION NOT NULL,
    TOTAL          DOUBLE PRECISION NOT NULL,
    NDSNAME        VARCHAR(10) CHARACTER SET UTF8 COLLATE UTF8,
    NDSEXTCODE     VARCHAR(10) CHARACTER SET UTF8 NOT NULL COLLATE UTF8
);

CREATE TABLE TECHRETURN (
    ID           INTEGER NOT NULL,
    SESSION_ID   INTEGER NOT NULL,
    NUM          INTEGER NOT NULL,
    ODT          TIMESTAMP NOT NULL,
    FUELNAME     VARCHAR(100) CHARACTER SET UTF8 COLLATE UTF8,
    FUELEXTCODE  VARCHAR(11) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    TANKNUM      VARCHAR(10) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    TANKEXTCODE  VARCHAR(10) CHARACTER SET UTF8 COLLATE UTF8,
    VOLUME       DOUBLE PRECISION NOT NULL,
    MASS         DOUBLE PRECISION NOT NULL,
    DENSITY      DOUBLE PRECISION NOT NULL
);

CREATE TABLE TRADEDOCSINBILL (
    ID               INTEGER NOT NULL,
    SESSION_ID       INTEGER NOT NULL,
    INBILLHID        INTEGER NOT NULL,
    NDOC             VARCHAR(16) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    DATEDOC          TIMESTAMP NOT NULL,
    PRICENAME        VARCHAR(50) CHARACTER SET UTF8 COLLATE UTF8,
    PRICEEXTCODE     VARCHAR(10) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    PARTNERNAME      VARCHAR(100) CHARACTER SET UTF8 COLLATE UTF8,
    PARTNEREXTCODE   VARCHAR(12) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    PARTNERINN       VARCHAR(20) CHARACTER SET UTF8 COLLATE UTF8,
    PARTNERKPP       VARCHAR(20) CHARACTER SET UTF8 COLLATE UTF8,
    STORAGESNAME     VARCHAR(50) CHARACTER SET UTF8 COLLATE UTF8,
    STORAGESEXTCODE  VARCHAR(10) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    FIRMSNAME        VARCHAR(50) CHARACTER SET UTF8 COLLATE UTF8,
    FIRMSEXTCODE     VARCHAR(10) CHARACTER SET UTF8 NOT NULL COLLATE UTF8
);

CREATE TABLE USEROPTIONS (
    ID            INTEGER NOT NULL,
    USER_ID       INTEGER NOT NULL,
    OPNAME1       VARCHAR(32) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    OPTVALUE1     VARCHAR(32) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    OPTFULLNAME1  VARCHAR(64) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    OPNAME2       VARCHAR(32) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    OPTVALUE2     VARCHAR(32) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    OPTFULLNAME2  VARCHAR(64) CHARACTER SET UTF8 NOT NULL COLLATE UTF8
);

CREATE TABLE USERS (
    ID          INTEGER NOT NULL,
    LOGIN       VARCHAR(24) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    "PASSWORD"  VARCHAR(48) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    FIO         VARCHAR(100) CHARACTER SET UTF8 COLLATE UTF8,
    "ROLE"      INTEGER DEFAULT 0 NOT NULL,
    EMAIL       VARCHAR(64) CHARACTER SET UTF8 COLLATE UTF8,
    "POSITION"  VARCHAR(20) CHARACTER SET UTF8 COLLATE UTF8
);

CREATE TABLE WARES (
    CODE  VARCHAR(11) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    NAME  VARCHAR(100) CHARACTER SET UTF8 COLLATE UTF8
);

INSERT INTO USERS (ID, LOGIN, "PASSWORD", FIO, "ROLE", EMAIL, "POSITION") VALUES (1, 'admin', '', 'admin a', 1, '33', 'admin');
INSERT INTO USERS (ID, LOGIN, "PASSWORD", FIO, "ROLE", EMAIL, "POSITION") VALUES (2, 'user1', '', 'user User', 0, '', 'dir');
INSERT INTO USERS (ID, LOGIN, "PASSWORD", FIO, "ROLE", EMAIL, "POSITION") VALUES (3, 'u1', 'u', 'u 1', 0, NULL, NULL);
INSERT INTO USERS (ID, LOGIN, "PASSWORD", FIO, "ROLE", EMAIL, "POSITION") VALUES (4, 'u2', 'u', 'u 2', 0, NULL, NULL);

COMMIT WORK;

INSERT INTO TABLESLIST (ID, TABLENAME) VALUES (1, 'OutcomesByOffice');
INSERT INTO TABLESLIST (ID, TABLENAME) VALUES (2, 'OutcomesByRetail');
INSERT INTO TABLESLIST (ID, TABLENAME) VALUES (3, 'IncomesByDischarge');
INSERT INTO TABLESLIST (ID, TABLENAME) VALUES (4, 'ItemOutcomesByRetail');
INSERT INTO TABLESLIST (ID, TABLENAME) VALUES (5, 'TradeDocsInBill');
INSERT INTO TABLESLIST (ID, TABLENAME) VALUES (7, 'TechReturn');
INSERT INTO TABLESLIST (ID, TABLENAME) VALUES (8, 'CashFlow');
INSERT INTO TABLESLIST (ID, TABLENAME) VALUES (9, 'OutcomesByCoupon');
INSERT INTO TABLESLIST (ID, TABLENAME) VALUES (10, 'ItemRests');
INSERT INTO TABLESLIST (ID, TABLENAME) VALUES (11, 'Hoses');
INSERT INTO TABLESLIST (ID, TABLENAME) VALUES (12, 'Tanks');

COMMIT WORK;

INSERT INTO STATIONS (CODE, NAME, EXTCODE) VALUES ('004', 'Александровская', '00-000001');
INSERT INTO STATIONS (CODE, NAME, EXTCODE) VALUES ('001', 'Ильинская', '00-000003');
INSERT INTO STATIONS (CODE, NAME, EXTCODE) VALUES ('002', 'Балезинская', '00-000002');
INSERT INTO STATIONS (CODE, NAME, EXTCODE) VALUES ('003', 'Кизнерская', '00-000004');
INSERT INTO STATIONS (CODE, NAME, EXTCODE) VALUES ('006', '333', '00');
INSERT INTO STATIONS (CODE, NAME, EXTCODE) VALUES ('005', 'Березовая', '00-000005');
INSERT INTO STATIONS (CODE, NAME, EXTCODE) VALUES ('007', 'gggg', 'Нет');
INSERT INTO STATIONS (CODE, NAME, EXTCODE) VALUES ('009', 'Петросервис', '?');
INSERT INTO STATIONS (CODE, NAME, EXTCODE) VALUES ('008', '008', '?');
INSERT INTO STATIONS (CODE, NAME, EXTCODE) VALUES ('998', '998', '?');
INSERT INTO STATIONS (CODE, NAME, EXTCODE) VALUES ('999', '999', '?');

COMMIT WORK;



/******************************************************************************/
/*                             Unique constraints                             */
/******************************************************************************/

ALTER TABLE IOTANKSHOSES ADD CONSTRAINT UNQ1_IOTANKSHOSES UNIQUE (SESSION_ID, TANKNUM, HOSENUM, AZSCODE);
ALTER TABLE ORDERS ADD CONSTRAINT UNQ1_ORDERS UNIQUE (AZSCODE, ODT, PUMPNUM);
ALTER TABLE USEROPTIONS ADD CONSTRAINT UNQ1_USEROPTIONS UNIQUE (USER_ID);


/******************************************************************************/
/*                                Primary keys                                */
/******************************************************************************/

ALTER TABLE ACTIONLOG ADD CONSTRAINT PK_ACTIONLOG PRIMARY KEY (ID);
ALTER TABLE CASHFLOW ADD CONSTRAINT PK_CASHFLOW PRIMARY KEY (ID);
ALTER TABLE CONTRACTS ADD CONSTRAINT PK_CONTRACTS PRIMARY KEY (ID);
ALTER TABLE CONTRAGENTS ADD CONSTRAINT PK_CONTRAGENTS PRIMARY KEY (CODE);
ALTER TABLE FIRMS ADD CONSTRAINT PK_FIRMS PRIMARY KEY (CODE);
ALTER TABLE HOSES ADD CONSTRAINT PK_HOSES PRIMARY KEY (ID);
ALTER TABLE INCOMESBYDISCHARGE ADD CONSTRAINT PK_INCOMESBYDISCHARGE PRIMARY KEY (ID);
ALTER TABLE INOUTGSM ADD CONSTRAINT PK_INOUTGSM PRIMARY KEY (ID);
ALTER TABLE IOTANKSHOSES ADD CONSTRAINT PK_IOTANKSHOSES PRIMARY KEY (ID);
ALTER TABLE ITEMOUTCOMESBYRETAIL ADD CONSTRAINT PK_ITEMOUTCOMESBYRETAIL PRIMARY KEY (ID);
ALTER TABLE ITEMRESTS ADD CONSTRAINT PK_ITEMRESTS PRIMARY KEY (ID);
ALTER TABLE ITEMS ADD CONSTRAINT PK_ITEMS PRIMARY KEY (CODE);
ALTER TABLE ORDERS ADD CONSTRAINT PK_ORDERS PRIMARY KEY (ID);
ALTER TABLE OUTCOMESBYCOUPON ADD CONSTRAINT PK_OUTCOMESBYCOUPON PRIMARY KEY (ID);
ALTER TABLE OUTCOMESBYOFFICE ADD CONSTRAINT PK_OUTCOMESBYOFFICE PRIMARY KEY (ID);
ALTER TABLE OUTCOMESBYRETAIL ADD PRIMARY KEY (ID);
ALTER TABLE PAYMENTMODES ADD CONSTRAINT PK_PAYMENTMODES PRIMARY KEY (CODE);
ALTER TABLE SESSIONS ADD PRIMARY KEY (ID);
ALTER TABLE STATIONS ADD CONSTRAINT PK_STATIONS PRIMARY KEY (CODE);
ALTER TABLE STORAGES ADD CONSTRAINT PK_STORAGES PRIMARY KEY (CODE);
ALTER TABLE TANKS ADD PRIMARY KEY (ID);
ALTER TABLE TDB_ITEMS ADD CONSTRAINT PK_TDB_ITEMS PRIMARY KEY (ID);
ALTER TABLE TECHRETURN ADD CONSTRAINT PK_TECHRETURN PRIMARY KEY (ID);
ALTER TABLE TRADEDOCSINBILL ADD CONSTRAINT PK_TRADEDOCSINBILL PRIMARY KEY (ID);
ALTER TABLE USEROPTIONS ADD CONSTRAINT PK_USEROPTIONS PRIMARY KEY (ID);
ALTER TABLE USERS ADD CONSTRAINT PK_USERS PRIMARY KEY (ID);
ALTER TABLE WARES ADD CONSTRAINT PK_WARES PRIMARY KEY (CODE);


/******************************************************************************/
/*                                Foreign keys                                */
/******************************************************************************/

ALTER TABLE ACTIONLOG ADD CONSTRAINT FK_ACTIONLOG_1 FOREIGN KEY (USER_ID) REFERENCES USERS (ID);
ALTER TABLE CASHFLOW ADD CONSTRAINT FK_CASHFLOW_1 FOREIGN KEY (SESSION_ID) REFERENCES SESSIONS (ID);
ALTER TABLE CONTRACTS ADD CONSTRAINT FK_CONTRACTS_1 FOREIGN KEY (PARTNER_CODE) REFERENCES CONTRAGENTS (CODE);
ALTER TABLE HOSES ADD CONSTRAINT FK_HOSES_1 FOREIGN KEY (SESSION_ID) REFERENCES SESSIONS (ID);
ALTER TABLE INCOMESBYDISCHARGE ADD CONSTRAINT FK_INCOMESBYDISCHARGE_1 FOREIGN KEY (SESSION_ID) REFERENCES SESSIONS (ID);
ALTER TABLE INCOMESBYDISCHARGE ADD CONSTRAINT FK_INCOMESBYDISCHARGE_2 FOREIGN KEY (FUELEXTCODE) REFERENCES WARES (CODE);
ALTER TABLE INCOMESBYDISCHARGE ADD CONSTRAINT FK_INCOMESBYDISCHARGE_3 FOREIGN KEY (PARTNEREXTCODE) REFERENCES CONTRAGENTS (CODE);
ALTER TABLE INOUTGSM ADD CONSTRAINT FK_INOUTGSM_1 FOREIGN KEY (SESSION_ID) REFERENCES SESSIONS (ID);
ALTER TABLE INOUTGSM ADD CONSTRAINT FK_INOUTGSM_2 FOREIGN KEY (CLIENT_CODE) REFERENCES CONTRAGENTS (CODE);
ALTER TABLE INOUTGSM ADD CONSTRAINT FK_INOUTGSM_3 FOREIGN KEY (CONTRACT_ID) REFERENCES CONTRACTS (ID) ON DELETE SET NULL ON UPDATE SET NULL;
ALTER TABLE INOUTGSM ADD CONSTRAINT FK_INOUTGSM_4 FOREIGN KEY (PAYMENT_CODE) REFERENCES PAYMENTMODES (CODE);
ALTER TABLE INOUTGSM ADD CONSTRAINT FK_INOUTGSM_5 FOREIGN KEY (WARE_CODE) REFERENCES WARES (CODE);
ALTER TABLE INOUTGSM ADD CONSTRAINT FK_INOUTGSM_6 FOREIGN KEY (LASTUSER_ID) REFERENCES USERS (ID);
ALTER TABLE IOTANKSHOSES ADD CONSTRAINT FK_IOTANKSHOSES_1 FOREIGN KEY (SESSION_ID) REFERENCES SESSIONS (ID);
ALTER TABLE IOTANKSHOSES ADD CONSTRAINT FK_IOTANKSHOSES_2 FOREIGN KEY (WARECODE) REFERENCES WARES (CODE);
ALTER TABLE IOTANKSHOSES ADD CONSTRAINT FK_IOTANKSHOSES_3 FOREIGN KEY (LASTUSER_ID) REFERENCES USERS (ID);
ALTER TABLE ITEMOUTCOMESBYRETAIL ADD CONSTRAINT FK_ITEMOUTCOMESBYRETAIL_1 FOREIGN KEY (ITEMEXTCODE) REFERENCES ITEMS (CODE);
ALTER TABLE ITEMOUTCOMESBYRETAIL ADD CONSTRAINT FK_ITEMOUTCOMESBYRETAIL_2 FOREIGN KEY (PAYMENTMODEEXTCODE) REFERENCES PAYMENTMODES (CODE);
ALTER TABLE ITEMOUTCOMESBYRETAIL ADD CONSTRAINT FK_ITEMOUTCOMESBYRETAIL_3 FOREIGN KEY (PARTNEREXTCODE) REFERENCES CONTRAGENTS (CODE);
ALTER TABLE ITEMOUTCOMESBYRETAIL ADD CONSTRAINT FK_ITEMOUTCOMESBYRETAIL_4 FOREIGN KEY (SESSION_ID) REFERENCES SESSIONS (ID);
ALTER TABLE ITEMRESTS ADD CONSTRAINT FK_ITEMRESTS_1 FOREIGN KEY (SESSION_ID) REFERENCES SESSIONS (ID);
ALTER TABLE ITEMRESTS ADD CONSTRAINT FK_ITEMRESTS_2 FOREIGN KEY (STORAGEEXTCODE) REFERENCES STORAGES (CODE);
ALTER TABLE ITEMRESTS ADD CONSTRAINT FK_ITEMRESTS_3 FOREIGN KEY (ITEMEXTCODE) REFERENCES ITEMS (CODE);
ALTER TABLE OUTCOMESBYCOUPON ADD CONSTRAINT FK_OUTCOMESBYCOUPON_1 FOREIGN KEY (SESSION_ID) REFERENCES SESSIONS (ID);
ALTER TABLE OUTCOMESBYOFFICE ADD CONSTRAINT FK_OUTCOMESBYOFFICE_1 FOREIGN KEY (FUELEXTCODE) REFERENCES WARES (CODE);
ALTER TABLE OUTCOMESBYOFFICE ADD CONSTRAINT FK_OUTCOMESBYOFFICE_2 FOREIGN KEY (PAYMENTMODEEXTCODE) REFERENCES PAYMENTMODES (CODE);
ALTER TABLE OUTCOMESBYOFFICE ADD CONSTRAINT FK_OUTCOMESBYOFFICE_3 FOREIGN KEY (SESSION_ID) REFERENCES SESSIONS (ID);
ALTER TABLE OUTCOMESBYRETAIL ADD CONSTRAINT FK_OUTCOMESBYRETAIL_1 FOREIGN KEY (SESSION_ID) REFERENCES SESSIONS (ID);
ALTER TABLE OUTCOMESBYRETAIL ADD CONSTRAINT FK_OUTCOMESBYRETAIL_2 FOREIGN KEY (FUELEXTCODE) REFERENCES WARES (CODE);
ALTER TABLE OUTCOMESBYRETAIL ADD CONSTRAINT FK_OUTCOMESBYRETAIL_3 FOREIGN KEY (PAYMENTMODEEXTCODE) REFERENCES PAYMENTMODES (CODE);
ALTER TABLE OUTCOMESBYRETAIL ADD CONSTRAINT FK_OUTCOMESBYRETAIL_4 FOREIGN KEY (PARTNEREXTCODE) REFERENCES CONTRAGENTS (CODE);
ALTER TABLE TANKS ADD CONSTRAINT FK_TANKS_1 FOREIGN KEY (SESSION_ID) REFERENCES SESSIONS (ID);
ALTER TABLE TDB_ITEMS ADD CONSTRAINT FK_TDB_ITEMS_1 FOREIGN KEY (BILL_ID) REFERENCES TRADEDOCSINBILL (ID);
ALTER TABLE TDB_ITEMS ADD CONSTRAINT FK_TDB_ITEMS_2 FOREIGN KEY (ITEMEXTCODE) REFERENCES ITEMS (CODE);
ALTER TABLE TECHRETURN ADD CONSTRAINT FK_TECHRETURN_1 FOREIGN KEY (SESSION_ID) REFERENCES SESSIONS (ID);
ALTER TABLE TECHRETURN ADD CONSTRAINT FK_TECHRETURN_2 FOREIGN KEY (FUELEXTCODE) REFERENCES WARES (CODE);
ALTER TABLE TRADEDOCSINBILL ADD CONSTRAINT FK_TRADEDOCSINBILL_1 FOREIGN KEY (SESSION_ID) REFERENCES SESSIONS (ID);
ALTER TABLE TRADEDOCSINBILL ADD CONSTRAINT FK_TRADEDOCSINBILL_2 FOREIGN KEY (PARTNEREXTCODE) REFERENCES CONTRAGENTS (CODE);
ALTER TABLE TRADEDOCSINBILL ADD CONSTRAINT FK_TRADEDOCSINBILL_3 FOREIGN KEY (STORAGESEXTCODE) REFERENCES STORAGES (CODE);
ALTER TABLE TRADEDOCSINBILL ADD CONSTRAINT FK_TRADEDOCSINBILL_4 FOREIGN KEY (FIRMSEXTCODE) REFERENCES FIRMS (CODE);
ALTER TABLE USEROPTIONS ADD CONSTRAINT FK_USEROPTIONS_1 FOREIGN KEY (USER_ID) REFERENCES USERS (ID);


/******************************************************************************/
/*                                  Indices                                   */
/******************************************************************************/

CREATE UNIQUE INDEX SESSIONS_IDX1 ON SESSIONS (AZSCODE, SESSIONNUM, STARTDATETIME);


/******************************************************************************/
/*                                  Triggers                                  */
/******************************************************************************/



SET TERM ^ ;



/******************************************************************************/
/*                            Triggers for tables                             */
/******************************************************************************/



/* Trigger: ACTIONLOG_BI */
CREATE OR ALTER TRIGGER ACTIONLOG_BI FOR ACTIONLOG
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.id is null) then
    new.id = gen_id(gen_actionlog_id,1);
end
^

/* Trigger: CASHFLOW_BI */
CREATE OR ALTER TRIGGER CASHFLOW_BI FOR CASHFLOW
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.id is null) then
    new.id = gen_id(gen_cashflow_id,1);
end
^

/* Trigger: CONTRACTS_BI */
CREATE OR ALTER TRIGGER CONTRACTS_BI FOR CONTRACTS
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.id is null) then
    new.id = gen_id(gen_contracts_id,1);
end
^

/* Trigger: HOSES_BI */
CREATE OR ALTER TRIGGER HOSES_BI FOR HOSES
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.id is null) then
    new.id = gen_id(gen_hoses_id,1);
end
^

/* Trigger: INCOMESBYDISCHARGE_BI */
CREATE OR ALTER TRIGGER INCOMESBYDISCHARGE_BI FOR INCOMESBYDISCHARGE
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.id is null) then
    new.id = gen_id(gen_incomesbydischarge_id,1);
end
^

/* Trigger: INOUTGSM_BI */
CREATE OR ALTER TRIGGER INOUTGSM_BI FOR INOUTGSM
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.id is null) then
    new.id = gen_id(gen_inoutgsm_id,1);
end
^

/* Trigger: IOTANKSHOSES_BI */
CREATE OR ALTER TRIGGER IOTANKSHOSES_BI FOR IOTANKSHOSES
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.id is null) then
    new.id = gen_id(gen_iotankshoses_id,1);
end
^

/* Trigger: ITEMOUTCOMESBYRETAIL_BI */
CREATE OR ALTER TRIGGER ITEMOUTCOMESBYRETAIL_BI FOR ITEMOUTCOMESBYRETAIL
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.id is null) then
    new.id = gen_id(gen_itemoutcomesbyretail_id,1);
end
^

/* Trigger: ITEMRESTS_BI */
CREATE OR ALTER TRIGGER ITEMRESTS_BI FOR ITEMRESTS
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.id is null) then
    new.id = gen_id(gen_itemrests_id,1);
end
^

/* Trigger: OBO_TRUNCCODES_BI */
CREATE OR ALTER TRIGGER OBO_TRUNCCODES_BI FOR OUTCOMESBYOFFICE
INACTIVE BEFORE INSERT POSITION 0
AS
    declare n int;
begin
  /* Trigger text */
  n = char_length(new.fuelextcode);
  if (:n > 11) then
  begin
    new.fuelextcode = substring(new.fuelextcode from (:n - 10) for 11);
  end
end
^

/* Trigger: OBR_TRUNCCODES_BI */
CREATE OR ALTER TRIGGER OBR_TRUNCCODES_BI FOR OUTCOMESBYRETAIL
INACTIVE BEFORE INSERT POSITION 0
AS
    declare n int;
begin
  /* Trigger text */
  n = char_length(new.fuelextcode);
  if (:n > 11) then
  begin
    new.fuelextcode = substring(new.fuelextcode from :n - 10 for 11);
  end
end
^

/* Trigger: ORDERS_BI */
CREATE OR ALTER TRIGGER ORDERS_BI FOR ORDERS
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.id is null) then
    new.id = gen_id(gen_orders_id,1);
end
^

/* Trigger: OUTCOMESBYCOUPON_BI */
CREATE OR ALTER TRIGGER OUTCOMESBYCOUPON_BI FOR OUTCOMESBYCOUPON
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.id is null) then
    new.id = gen_id(gen_outcomesbycoupon_id,1);
end
^

/* Trigger: OUTCOMESBYOFFICE_BI */
CREATE OR ALTER TRIGGER OUTCOMESBYOFFICE_BI FOR OUTCOMESBYOFFICE
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.id is null) then
    new.id = gen_id(gen_outcomesbyoffice_id,1);
end
^

/* Trigger: OUTCOMESBYRETAIL_BI */
CREATE OR ALTER TRIGGER OUTCOMESBYRETAIL_BI FOR OUTCOMESBYRETAIL
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.id is null) then
    new.id = gen_id(gen_outcomesbyretail_id,1);
end
^

/* Trigger: SESSIONS_BI */
CREATE OR ALTER TRIGGER SESSIONS_BI FOR SESSIONS
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.id is null) then
    new.id = gen_id(gen_sessions_id,1);
end
^

/* Trigger: TABLESLIST_BI */
CREATE OR ALTER TRIGGER TABLESLIST_BI FOR TABLESLIST
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.id is null) then
    new.id = gen_id(gen_tableslist_id,1);
end
^

/* Trigger: TANKS_BI */
CREATE OR ALTER TRIGGER TANKS_BI FOR TANKS
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.id is null) then
    new.id = gen_id(gen_tanks_id,1);
end
^

/* Trigger: TDB_ITEMS_BI */
CREATE OR ALTER TRIGGER TDB_ITEMS_BI FOR TDB_ITEMS
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.id is null) then
    new.id = gen_id(gen_tdb_items_id,1);
end
^

/* Trigger: TECHRETURN_BI */
CREATE OR ALTER TRIGGER TECHRETURN_BI FOR TECHRETURN
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.id is null) then
    new.id = gen_id(gen_techreturn_id,1);
end
^

/* Trigger: TRADEDOCSINBILL_BI */
CREATE OR ALTER TRIGGER TRADEDOCSINBILL_BI FOR TRADEDOCSINBILL
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.id is null) then
    new.id = gen_id(gen_tradedocsinbill_id,1);
end
^

/* Trigger: USEROPTIONS_BI */
CREATE OR ALTER TRIGGER USEROPTIONS_BI FOR USEROPTIONS
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.id is null) then
    new.id = gen_id(gen_useroptions_id,1);
end
^

/* Trigger: USERS_BI */
CREATE OR ALTER TRIGGER USERS_BI FOR USERS
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.id is null) then
    new.id = gen_id(gen_users_id,1);
end
^
SET TERM ; ^



/******************************************************************************/
/*                             Stored procedures                              */
/******************************************************************************/



SET TERM ^ ;

CREATE OR ALTER PROCEDURE CALCINCOMES (
    SESSION_ID INTEGER NOT NULL,
    TANKNUM VARCHAR(10) CHARACTER SET UTF8 NOT NULL COLLATE UTF8)
RETURNS (
    VOLUME DOUBLE PRECISION NOT NULL)
AS
declare variable vt double precision;
declare variable v double precision;
begin
/*
    select sum(volume) from incomesbydischarge
            where session_id = :session_id
                and tanknum=:tanknum
    into :v;
    if (:v is null) then v = 0;

    volume = :v;
    */
    select sum(volume) from incomesbydischarge
            where session_id = :session_id
                and tanknum=:tanknum
    into :v;
    if (:v is null) then v = 0;
    select sum(volume) from techreturn
            where session_id = :session_id
                and tanknum=:tanknum
    into :vt;
    if (:vt is null) then vt = 0;
    volume = :v+:vt;
  suspend;
end^


CREATE OR ALTER PROCEDURE CALCOUTCOMES (
    SESSION_ID INTEGER NOT NULL,
    TANKNUM VARCHAR(10) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    HOSENUM INTEGER NOT NULL)
RETURNS (
    VOLUME DOUBLE PRECISION NOT NULL)
AS
declare variable v double precision;
begin
    select sum(v) from
        (select sum(volume) as v from outcomesbyretail r
            where r.session_id = :session_id
                and r.tanknum=:tanknum
                and r.hosename=cast(:hosenum as varchar(10))

                /* TODO ADD COUPONS */


        /*  NO OFFICE!!!
        union all
        select sum(volume) as v from outcomesbyoffice
            where session_id = :session_id
                and tanknum=:tanknum
                and hosename=cast(:hosenum as varchar(10))
        */
        )
    into :v;
    if(:v is null)then v = 0;
    volume = :v;
    suspend;
end^


CREATE OR ALTER PROCEDURE RESTOREIOTHREC (
    SESSION_ID INTEGER NOT NULL,
    AZSCODE VARCHAR(10) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    TANKNUM VARCHAR(10) CHARACTER SET UTF8 NOT NULL COLLATE UTF8,
    HOSENUM INTEGER NOT NULL)
AS
declare variable scnt double precision not null;
declare variable ecnt double precision not null;
declare variable density double precision;
declare variable stv double precision;
declare variable etv double precision;
begin
  for select distinct
  t.startfuelvolume,
  t.endfactvolume,
  t.enddensity,
  h.startcounter,
  h.endcounter
                from
                    hoses h
                    inner join tanks t on h.tanknum = t.tanknum
                    join sessions s on s.id = h.session_id

                where t.session_id = :session_id
                    and s.id = t.session_id
                    and s.id = t.session_id
                    and t.tanknum = :tanknum
                    and h.hosenum = :hosenum
            into :stv, :etv, :density, :scnt, :ecnt
    do
    begin
        update iotankshoses
        set density = :density, 
            startfuelvolume = :stv, 
            endfactvolume = :etv,
            startcounter = :scnt, 
            endcounter = :ecnt
        where
            session_id = :session_id
            and azscode = :azscode
            and tanknum = :tanknum
            and hosenum = :hosenum
            ;
    end
  suspend;
end^



SET TERM ; ^



/******************************************************************************/
/*                            Fields descriptions                             */
/******************************************************************************/

COMMENT ON COLUMN INOUTGSM.DIRECTION IS
'0 - out  1 -in';

COMMENT ON COLUMN INOUTGSM.CLIENT_CODE IS
'fk to contragents';

COMMENT ON COLUMN INOUTGSM.CONTRACT_ID IS
'fk to contracts';

COMMENT ON COLUMN INOUTGSM.PAYMENT_CODE IS
'fk to paymentmodes';

COMMENT ON COLUMN INOUTGSM.WARE_CODE IS
'fk to wares';

COMMENT ON COLUMN INOUTGSM.LASTUSER_ID IS
'fk to users';

COMMENT ON COLUMN INOUTGSM.STATE IS
'0 - new 1 - in process 2 - completed';

COMMENT ON COLUMN ITEMOUTCOMESBYRETAIL.ITEMGRPEXTCODE IS
'" АЗС" + azscode';

COMMENT ON COLUMN ITEMOUTCOMESBYRETAIL.ITEMCODE IS
'icode in @items@';

COMMENT ON COLUMN OUTCOMESBYCOUPON.SESSIONID IS
'as in source xml';

COMMENT ON COLUMN OUTCOMESBYCOUPON.FUELEXTCODE IS
'только для справки, в исходнике нет кода';

COMMENT ON COLUMN OUTCOMESBYRETAIL.FUELNAME IS
'doubles, no need';

COMMENT ON COLUMN OUTCOMESBYRETAIL.PAYMENTMODENAME IS
'see table  paymentmodes';

COMMENT ON COLUMN OUTCOMESBYRETAIL.FUELEXTCODE IS
'link to wares, 1C ware code';

COMMENT ON COLUMN OUTCOMESBYRETAIL.PAYMENTMODEEXTCODE IS
'to table paymentmodes';

COMMENT ON COLUMN OUTCOMESBYRETAIL.PARTNEREXTCODE IS
'1C code, link to contragents';

COMMENT ON COLUMN OUTCOMESBYRETAIL.REMARK IS
'wtf?';

COMMENT ON COLUMN USERS."ROLE" IS
'0 user 1 admin';

