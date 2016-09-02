CREATE TABLE currency (
currencyid NUMBER(18) NOT NULL,
name VARCHAR2(30) NOT NULL,
code VARCHAR2(3) NOT NULL,
CONSTRAINT pk_currency PRIMARY KEY (currencyid)
)
;

CREATE SEQUENCE s_currency
    START WITH 1
;
CREATE UNIQUE INDEX uidx_currency_code ON currency
( code ASC )
;

INSERT INTO currency ( currencyid, name, code ) VALUES ( 1, 'United Stated Dollar', 'USD' )
;
INSERT INTO currency ( currencyid, name, code ) VALUES ( 2, 'Mexican Peso', 'MXN' )
;
INSERT INTO currency ( currencyid, name, code ) VALUES ( 3, 'Chinese Yuan', 'CNY' )
;
INSERT INTO currency ( currencyid, name, code ) VALUES ( 4, 'Euro', 'EUR' )
;
INSERT INTO currency ( currencyid, name, code ) VALUES ( 5, 'Indian Rupee', 'INR' )
;
