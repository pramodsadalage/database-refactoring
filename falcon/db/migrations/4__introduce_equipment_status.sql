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
  WHERE UPPER(equipmentstatus) LIKE '%NEW%'
;

UPDATE equipment SET equipmentstatusid =
  (SELECT equipmentstatusid FROM equipmentstatus WHERE name = 'Used')
  WHERE UPPER(equipmentstatus) LIKE '%USED%'
;

UPDATE equipment SET equipmentstatusid =
  (SELECT equipmentstatusid FROM equipmentstatus WHERE name = 'Used')
  WHERE equipmentstatus IS NOT NULL AND equipmentstatusid IS NULL
;

ALTER TABLE equipment MODIFY equipmentstatusid NOT NULL;

ALTER TABLE equipment
  ADD (CONSTRAINT fk_equipment_equipmentstatus FOREIGN KEY (equipmentstatusid)
  REFERENCES equipmentstatus)
;

--Drop equipmentstatus
