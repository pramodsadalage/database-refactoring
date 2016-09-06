CREATE TABLE fueltype (
fueltypeid NUMBER(18) NOT NULL,
name VARCHAR2(30) NOT NULL,
CONSTRAINT pk_fueltype PRIMARY KEY (fueltypeid)
)
;

CREATE SEQUENCE s_fueltype
    START WITH 1
;
CREATE UNIQUE INDEX uidx_fueltype_name ON fueltype
( name);

INSERT INTO fueltype (fueltypeid,name) VALUES ( s_fueltype.nextval, 'Gasoline')
;
INSERT INTO fueltype (fueltypeid,name) VALUES ( s_fueltype.nextval, 'Diesel')
;
INSERT INTO fueltype (fueltypeid,name) VALUES ( s_fueltype.nextval, 'CNG')
;
INSERT INTO fueltype (fueltypeid,name) VALUES ( s_fueltype.nextval, 'Electric')
;
INSERT INTO fueltype (fueltypeid,name) VALUES ( s_fueltype.nextval, 'Coal')
;

ALTER TABLE equipment ADD fueltypeid NUMBER(18) NULL
;

UPDATE equipment SET fueltypeid =
  (SELECT fueltypeid FROM fueltype WHERE name = 'Diesel')
  WHERE fueltypeid IS NULL
;
ALTER TABLE equipment MODIFY fueltypeid NOT NULL;

ALTER TABLE equipment
  ADD (CONSTRAINT fk_equipment_fueltype FOREIGN KEY (fueltypeid)
  REFERENCES fueltype)
;
