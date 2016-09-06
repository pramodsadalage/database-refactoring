CREATE TABLE country (
countryid NUMBER(18) NOT NULL,
name VARCHAR2(30) NOT NULL,
code VARCHAR2(3) NOT NULL,
CONSTRAINT pk_country PRIMARY KEY (countryid)
)
;

CREATE SEQUENCE s_country
    START WITH 1
;
CREATE UNIQUE INDEX uidx_country_code ON country
( code );

INSERT INTO COUNTRY ( COUNTRYID, NAME, CODE ) VALUES (s_country.nextval,'United States', 'US')
;
INSERT INTO COUNTRY ( COUNTRYID, NAME, CODE ) VALUES (s_country.nextval,'Mexico', 'MX')
;
INSERT INTO COUNTRY ( COUNTRYID, NAME, CODE ) VALUES (s_country.nextval,'China', 'CN')
;
INSERT INTO COUNTRY ( COUNTRYID, NAME, CODE ) VALUES (s_country.nextval,'Spain', 'ES')
;
INSERT INTO COUNTRY ( COUNTRYID, NAME, CODE ) VALUES (s_country.nextval,'India', 'IN')
;
