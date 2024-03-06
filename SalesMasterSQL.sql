create database sales_master;
use sales_master;
create table sales( SALESMAN_NO VARCHAR(6) PRIMARY KEY CHECK (SALESMAN_NO LIKE 'S%'),
    SALES_NAME VARCHAR(20) NOT NULL,
    ADDRESS VARCHAR(20) NOT NULL,
    CITY VARCHAR(20),
    STATE VARCHAR(20),
    PINCODE INT(6),
    SAL_AMT NUMERIC(8,2) NOT NULL CHECK (SAL_AMT <> 0),
    Tgt_to_get NUMERIC(6,2) NOT NULL CHECK (Tgt_to_get <> 0),
    Ytd_sales NUMERIC(6,2) NOT NULL CHECK (Ytd_sales <> 0),
    Remark VARCHAR(30)
);

