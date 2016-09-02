CREATE TABLE equipmenttype (
equipmenttypeid NUMBER(18) NOT NULL,
name VARCHAR2(30) NOT NULL,
CONSTRAINT pk_equipmenttype PRIMARY KEY (equipmenttypeid)
)
;
CREATE SEQUENCE s_equipmenttype
    START WITH 1000
;

INSERT INTO EQUIPMENTTYPE (EQUIPMENTTYPEID,NAME) VALUES ( s_equipmenttype.nextval, 'Engine' )
;
INSERT INTO EQUIPMENTTYPE (EQUIPMENTTYPEID,NAME) VALUES ( s_equipmenttype.nextval, 'Lift Truck' )
;
INSERT INTO EQUIPMENTTYPE (EQUIPMENTTYPEID,NAME) VALUES ( s_equipmenttype.nextval, 'Construction' )
;
INSERT INTO EQUIPMENTTYPE (EQUIPMENTTYPEID,NAME) VALUES ( s_equipmenttype.nextval, 'Other' )
;
