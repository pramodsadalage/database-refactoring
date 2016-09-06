CREATE TABLE manufacturer (
manufacturerid NUMBER(18) NOT NULL,
name VARCHAR2(30) NOT NULL,
CONSTRAINT pk_manufacturer PRIMARY KEY (manufacturerid)
)
;

CREATE SEQUENCE s_manufacturer
    START WITH 1
;

INSERT INTO manufacturer (manufacturerid, name) VALUES ( s_manufacturer.nextval, 'Toyota' )
;
INSERT INTO manufacturer (manufacturerid, name) VALUES ( s_manufacturer.nextval, 'Volvo' )
;
INSERT INTO manufacturer (manufacturerid, name) VALUES ( s_manufacturer.nextval, 'JLG' )
;
INSERT INTO manufacturer (manufacturerid, name) VALUES ( s_manufacturer.nextval, 'Hyundai' )
;
INSERT INTO manufacturer (manufacturerid, name) VALUES ( s_manufacturer.nextval, 'Hitachi' )
;
INSERT INTO manufacturer (manufacturerid, name) VALUES ( s_manufacturer.nextval, 'Liebherr' )
;
INSERT INTO manufacturer (manufacturerid, name) VALUES ( s_manufacturer.nextval, 'Husqvarna' )
;
INSERT INTO manufacturer (manufacturerid, name) VALUES ( s_manufacturer.nextval, 'JCB' )
;
INSERT INTO manufacturer (manufacturerid, name) VALUES ( s_manufacturer.nextval, 'OTHER' )
;

--Add reference and migrate data
ALTER TABLE equipment ADD manufacturerid NUMBER(18) NULL
;

UPDATE equipment SET manufacturerid =
  (SELECT manufacturerid FROM manufacturer WHERE name = equipment.manufacturer)
  WHERE manufacturerid IS NULL
;

UPDATE equipment SET manufacturerid =
  (SELECT manufacturerid FROM manufacturer WHERE name = 'OTHER')
  WHERE manufacturerid IS NULL
;

ALTER TABLE equipment MODIFY manufacturerid NOT NULL;

ALTER TABLE equipment
  ADD (CONSTRAINT fk_equipment_manufacturer FOREIGN KEY (manufacturerid)
  REFERENCES MANUFACTURER)
;

--Drop manufacturer from equipment?
