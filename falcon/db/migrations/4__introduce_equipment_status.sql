CREATE TABLE equipmentstatus (
equipmentstatusid NUMBER(18) NOT NULL,
name VARCHAR2(30) NOT NULL,
CONSTRAINT pk_equipmentstatus PRIMARY KEY (equipmentstatusid)
)
;

CREATE SEQUENCE s_equipmentstatus
    START WITH 1
;

INSERT INTO equipmentstatus ( equipmentstatusid, name ) VALUES ( s_equipmentstatus.nextval, 'New' )
;
INSERT INTO equipmentstatus ( equipmentstatusid, name ) VALUES ( s_equipmentstatus.nextval, 'Used' )
;

ALTER TABLE equipment ADD equipmentstatusid NUMBER(18) NULL
;

UPDATE equipment SET equipmentstatusid =
  (SELECT equipmentstatusid FROM equipmentstatus WHERE name = 'New')
  WHERE equipmentstatusid IS NULL
;
ALTER TABLE equipment MODIFY equipmentstatusid NOT NULL;

ALTER TABLE equipment
  ADD (CONSTRAINT fk_equipment_equipmentstatus FOREIGN KEY (equipmentstatusid)
  REFERENCES equipmentstatus)
;
