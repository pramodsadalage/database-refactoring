CREATE TABLE contacttype (
contacttypeid NUMBER(18) NOT NULL,
name VARCHAR2(30) NOT NULL,
CONSTRAINT pk_contacttype PRIMARY KEY (contacttypeid)
)
;

CREATE SEQUENCE s_contacttype
    START WITH 1
;

INSERT INTO contacttype (contacttypeid,name) VALUES ( s_contacttype.nextval, 'Director')
;
INSERT INTO contacttype (contacttypeid,name) VALUES ( s_contacttype.nextval, 'Owner')
;
INSERT INTO contacttype (contacttypeid,name) VALUES ( s_contacttype.nextval, 'CEO')
;
INSERT INTO contacttype (contacttypeid,name) VALUES ( s_contacttype.nextval, 'Purchaser')
;
INSERT INTO contacttype (contacttypeid,name) VALUES ( s_contacttype.nextval, 'Gurantor')
;
INSERT INTO contacttype (contacttypeid,name) VALUES ( s_contacttype.nextval, 'Other')
;
